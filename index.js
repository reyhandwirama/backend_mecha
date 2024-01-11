require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const mysql = require("mysql");

const db = mysql.createPool({
  host: process.env.HOST,
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
});

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/produk", (req, res) => {
  const sqlSelect = "SELECT * FROM produk";
  db.query(sqlSelect, (err, result) => {
    res.send(result);
  });
});

app.get("/user", (req, res) => {
  const sqlSelect = "SELECT * FROM user";
  db.query(sqlSelect, (err, result) => {
    res.send(result);
  });
});

app.post("/api/upload", async (req, res) => {
  const Id_Order = req.body.Id_Order;
  const prev_image = req.body.Prev_Image;
  const Alamat = req.body.Alamat;
  const Notes = req.body.Notes;
  console.log(Notes);
  // Function to upload the image to Google Cloud Storage
  try {
    // Update the image URL in the database
    const query =
      "UPDATE orders SET dataImage=?, status=?, batasorder=?, alamat=? WHERE Id_Order=?";
    db.query(
      query,
      [prev_image, Notes, "", Alamat, Id_Order],
      (dbErr, result) => {
        if (dbErr) {
          console.error("Error saving the image URL to the database:", dbErr);
          return res
            .status(500)
            .json({ error: "Error saving the image URL to the database" });
        }
        console.log("Berhasil Diupload");
        res.json({
          message:
            "Image uploaded and saved to Google Cloud Storage and the database successfully!",
        });
      }
    );
  } catch (error) {
    res
      .status(500)
      .json({ error: "Error uploading the image to Google Cloud Storage" });
  }
});

app.get("/api/getData", (req, res) => {
  const query = "SELECT dataImage AS imagePath FROM orders";

  db.query(query, (err, result) => {
    if (err) {
      console.error("Error fetching data from the database:", err);
      return res
        .status(500)
        .json({ error: "Error fetching data from the database" });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: "Image data not found" });
    }
    console.log("Query Berhasil");
    const data = result[0];
    res.json(data);
  });
});

app.get("/api/getData", (req, res) => {
  const query = "SELECT dataImage AS imagePath FROM orders";

  db.query(query, (err, result) => {
    if (err) {
      console.error("Error fetching data from the database:", err);
      return res
        .status(500)
        .json({ error: "Error fetching data from the database" });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: "Image data not found" });
    }
    console.log(result);
    const data = result[0];
    res.json(data);
  });
});

app.get("/cart", (req, res) => {
  const sqlSelect = "SELECT * FROM cartdetail";
  db.query(sqlSelect, (err, result) => {
    res.send(result);
  });
});

app.post("/removeOrder", (req, res) => {
  const { Id_Order } = req.body;
  const sqlQuery = `DELETE FROM orders WHERE Id_Order="${Id_Order}"`;
  const sqlQuery1 = `DELETE FROM orderdetail WHERE Id_Order="${Id_Order}"`;

  db.query(sqlQuery, sqlQuery1, (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).json({ message: `${err}` });
    }
    res.send(result);
  });
});

app.post("/login", (req, res) => {
  const { Username, Password } = req.body;
  sqlQuery = `SELECT * FROM user WHERE Username="${Username}" AND Password="${Password}";`;

  db.query(sqlQuery, (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: `${err}` });
      return;
    }

    if (result.length === 0) {
      res.status(401).json({ error: "Invalid username or password" });
      return;
    }

    res.send(result);
  });
});

app.post("/updateOrder", (req, res) => {
  const { Id_Order, Kurir, Resi, Notes, Ongkir, BatasOrder } = req.body;
  console.log(Ongkir);
  sqlQuery = `UPDATE orders SET kurir="${Kurir}", noresi="${Resi}", status="${Notes}", ongkir=${Ongkir}, batasorder="${BatasOrder}"  WHERE Id_Order="${Id_Order}";`;
  db.query(sqlQuery, (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: `${err}` });
      return;
    }

    if (result.length === 0) {
      res.status(401).json({ error: "Invalid username or password" });
      return;
    }

    res.send(result);
  });
});

app.get("/getId_Order", (req, res) => {
  sqlQuery = `SELECT * FROM orders;`;

  db.query(sqlQuery, (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: `${err}` });
      return;
    }

    if (result.length === 0) {
      res.status(401).json({ error: "No Data " });
      return;
    }

    res.send(result);
  });
});

app.get("/getOrder", (req, res) => {
  sqlQuery = `SELECT * FROM orderdetail;`;

  db.query(sqlQuery, (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: `${err}` });
      return;
    }

    if (result.length === 0) {
      res.status(401).json({ error: "Invalid username or password" });
      return;
    }

    res.send(result);
  });
});

app.post("/register", (req, res) => {
  const { Username, Password, Email, Notelp, Alamat } = req.body;
  const Id_User = `${Username.slice(0, 3)}${Math.floor(
    Math.random() * (99999 - 10000 + 1) + 10000
  )}`;

  sqlQuery = `INSERT INTO user VALUES("${Id_User}","${Username}","${Password}","${Email}","${Notelp}","${Alamat}","user");`;

  db.query(sqlQuery, (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: `${err}` });
      return;
    }

    res.send(result);
  });
});

app.post("/getId_Cart", (req, res) => {
  const { Id_User } = req.body;
  sqlQuery = `SELECT Id_Cart FROM cart WHERE Id_User="${Id_User}";`;

  db.query(sqlQuery, (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: `${err}` });
      return;
    }
    res.send(result);
  });
});

app.post("/order", (req, res) => {
  const { Id_Order, Id_Product, Qty, Ttl_Belanja } = req.body;
  const sqlQuery1 = `INSERT INTO orderdetail (Id_Order, Id_Product, Qty, Ttl_Belanja) VALUES("${Id_Order}","${Id_Product}",${Qty},${Ttl_Belanja})`;

  db.query(sqlQuery1, (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).json({ message: `${err}` });
    }
    console.log(result);
    res.send(result[0]);
    res.send(result[1]);
    res.send(result[2]);
    res.send(result[3]);
    return result;
  });
});

app.post("/orders", (req, res) => {
  const { Id_Order, Id_User, Alamat } = req.body;
  const sqlQuery2 = `INSERT INTO orders (Id_Order, Id_User, status, dataImage, noresi,kurir,ongkir,alamat) VALUES("${Id_Order}","${Id_User}","Proses Ongkir","","","",0,"${Alamat}")`;
  const sqlQuery3 = `DELETE FROM cart WHERE Id_User="${Id_User}"`;
  const sqlQuery4 = `DELETE FROM cartdetail WHERE Id_User="${Id_User}"`;
  db.query(sqlQuery2, sqlQuery3, (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).json({ message: `${err}` });
    }
    db.query(sqlQuery4, (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ message: `${err}` });
      }
      console.log(result);
    });
    res.send(result);
  });
});
app.post("/user", (req, res) => {
  const { Username, Password } = req.body;
  sqlQuery = `SELECT * FROM user WHERE Username="${Username}" AND Password="${Password}";`;

  db.query(sqlQuery, (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: `${err}` });
      return;
    }

    if (result.length === 0) {
      res.status(401).json({ error: "Invalid username or password" });
      return;
    }

    res.send(result);
  });
});

app.post("/quantity", (req, res) => {
  const { quantity, Id_User, Id_Produk } = req.body;
  const sqlUpdate =
    "UPDATE cartdetail SET Qty=? where Id_User=? AND Id_Product=?;";
  db.query(sqlUpdate, [quantity, Id_User, Id_Produk], (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: "Error submitting data" });
    } else {
      res.status(200).json({ message: "Data update successfully" });
    }
  });
});

app.post("/update", (req, res) => {
  const { Id_User, Username, Password, Email, Notelp, Alamat } = req.body;
  const sqlUpdate = `UPDATE user SET username="${Username}",password="${Password}",email="${Email}",notelp="${Notelp}",alamat="${Alamat}" where Id_User="${Id_User}"`;
  db.query(sqlUpdate, (err, result) => {
    if (err) {
      console.log("Gagal Update");
      console.error("Error submitting data:", err);
      res.status(500).json({ message: "Error submitting data" });
    } else {
      console.log("Berhasil update");
      res.status(200).json({ message: "Data update successfully" });
    }
  });
});

app.post("/remover", (req, res) => {
  const { Id_User, Id_Produk } = req.body;
  const sqlUpdate = "delete from cartdetail where Id_User=? AND Id_Product=?;";
  db.query(sqlUpdate, [Id_User, Id_Produk], (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: "Error submitting data" });
    } else {
      res.status(200).json({ message: "Data update successfully" });
    }
  });
});

app.post("/checkout", (req, res) => {
  const Id_Cart = req.body.Id_Cart;
  const Qty = req.body.Qty;
  const Id_User = req.body.Id_User;
  const Id_Product = req.body.Id_Product;
  const Berat = req.body.Berat;
  const sqlInsert =
    "INSERT INTO cartdetail (Id_Cart,Qty,Id_User,Id_Product,weight) VALUES(?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE Qty = Qty + ?;";
  const sqlInsert1 = "INSERT IGNORE INTO cart VALUES(?, ?);";

  db.query(
    sqlInsert,
    [Id_Cart, Qty, Id_User, Id_Product, Qty, Berat],
    (err, result) => {
      if (err) {
        console.error("Error submitting data:", err);
        res.status(500).json({ message: "Error submitting data" });
      }
    }
  );

  db.query(sqlInsert1, [Id_Cart, Id_User], (err, result) => {
    if (err) {
      console.error("Error submitting data:", err);
      res.status(500).json({ message: "Error submitting data" });
    } else {
      res.status(200).json({ message: "Data submitted successfully" });
    }
  });
});


app.post("/create-product" ,(req,res) => {
  const
})

const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(`Running on port ${port}`);
});
