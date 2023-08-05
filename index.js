const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const mysql = require('mysql');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { Storage } = require('@google-cloud/storage');
process.env.GOOGLE_APPLICATION_CREDENTIALS = './scenic-adapter-395007-04e559844696.json';
const db = mysql.createPool({
    host: "sql6.freesqldatabase.com",
    user: "sql6637648",
    password: "7lT6931kjq",
    database: "sql6637648"
})
const upload = multer({ dest: 'uploads/' });
const bucketName = 'mechanical_keyboard'
const storage = new Storage();
app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({extended:true}));

app.get("/", (req,res) =>{
  res.json({message:"Success"})
})
app.get("/produk", (req,res) =>{
    const sqlSelect = "SELECT * FROM produk";
    db.query(sqlSelect, (err, result) =>{
        res.send(result);
    })
})

app.get("/user",(req,res) =>{
  const sqlSelect = "SELECT * FROM user";
    db.query(sqlSelect, (err, result) =>{
        res.send(result);
    })
})

app.use('/uploads', express.static(path.join(__dirname, '/uploads')));

app.post('/api/upload', upload.single('image'), async (req, res) => {
  const imagePath = req.file.path;
  const Id_Order = req.body.Id_Order;
  const prev_image = req.body.Prev_Image;

  fs.unlink(prev_image, (unlinkErr) => {
    if (unlinkErr) {
      console.error('Error deleting the image:', unlinkErr);
    }
  });

  // Function to upload the image to Google Cloud Storage
  async function uploadImageToGCS(imagePath) {
    try {
      // Generate a unique filename (you can use any logic here, like adding timestamp)
      const filename = `photo_${Date.now()}.jpg`;
      const file = storage.bucket(bucketName).file(prev_image);
      try {
        await file.delete();
        console.log(`Previous image "${prev_image}" has been removed from Google Cloud Storage.`);
      } catch (deleteErr) {
        // Handle the error if the file couldn't be deleted (e.g., file not found)
        console.error('Error deleting the previous image:', deleteErr);
        // You can decide how to handle the error. For example, you might log it and proceed.
      }
      // Upload the image to Google Cloud Storage
      try {
        await storage.bucket(bucketName).upload(imagePath, {
          destination: filename,
        }); 
      } catch (uploadErr) {
        console.error('Error uploading photo to Google Cloud Storage:', uploadErr);
        res.status(500).json({ error: 'Error uploading the image to Google Cloud Storage' });
      }

      // Get the public URL of the uploaded image
      return filename;
    } catch (err) {
      console.error('Error uploading photo to Google Cloud Storage:', err);
      throw err;
    }
  }

  try {
    // Upload the new image to Google Cloud Storage
    const gcsUrl = await uploadImageToGCS(imagePath);

    // Update the image URL in the database
    const query = "UPDATE orders SET dataImage=?, status=?, batasorder=? WHERE Id_Order=?";
    db.query(query, [gcsUrl, "Sedang Diproses", "", Id_Order], (dbErr, result) => {
      if (dbErr) {
        console.error('Error saving the image URL to the database:', dbErr);
        return res.status(500).json({ error: 'Error saving the image URL to the database' });
      }

      res.json({ message: 'Image uploaded and saved to Google Cloud Storage and the database successfully!' });
    });
  } catch (error) {
    res.status(500).json({ error: 'Error uploading the image to Google Cloud Storage' });
  }
});

app.get('/api/getData', (req, res) => {
  const query = 'SELECT dataImage AS imagePath FROM orders';

  db.query(query, (err, result) => {
    if (err) {
      console.error('Error fetching data from the database:', err);
      return res.status(500).json({ error: 'Error fetching data from the database' });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: 'Image data not found' });
    }

    const data = result[0];
    res.json(data);
  });
});

app.get("/cart", (req,res) =>{
    const sqlSelect = "SELECT * FROM cartdetail";
    db.query(sqlSelect, (err, result) =>{
        res.send(result);
    })
})

app.post("/removeOrder", (req,res) =>{
  const {Id_Order} = req.body;
  console.log(Id_Order);
  sqlQuery = "Delete From orders WHERE Id_Order=?";
  sqlQuery1 = "Delete From orderdetail WHERE Id_Order=?";
  
  db.query(sqlQuery,[Id_Order],(err,result) =>{
    if(err){
      res.status(500).json({message: `${err}`});
    }
    db.query(sqlQuery1,[Id_Order],(err,result) =>{
      if(err){
        res.status(500).json({message: `${err}`});
      }
    })
    res.send(result);
  })
})

app.post("/login", (req, res) => {
    const { Username,Password} = req.body;
      sqlQuery = `SELECT * FROM user WHERE Username="${Username}" AND Password="${Password}";`;
  
      db.query(sqlQuery, (err, result) => {
        if (err) {
          console.error('Error submitting data:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
  
        if (result.length === 0) {
          res.status(401).json({ error: 'Invalid username or password' });
          return;
        }
  
        res.send(result);
      });
  });

app.post("/updateOrder", (req, res) => {
    const { Id_Order,Kurir,Resi,Notes,Ongkir,BatasOrder} = req.body;
    console.log(BatasOrder);
      sqlQuery = `UPDATE orders SET kurir="${Kurir}", noresi="${Resi}", status="${Notes}", ongkir=${Ongkir}, batasorder="${BatasOrder}"  WHERE Id_Order="${Id_Order}";`;
      console.log(sqlQuery);
      db.query(sqlQuery, (err, result) => {
        if (err) {
          console.error('Error submitting data:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
  
        if (result.length === 0) {
          res.status(401).json({ error: 'Invalid username or password' });
          return;
        }
  
        res.send(result);
      });
  });
 
app.get("/getId_Order", (req, res) => {
      sqlQuery = `SELECT * FROM orders;`;

      db.query(sqlQuery, (err, result) => {
        if (err) {
          console.error('Error submitting data:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
  
        if (result.length === 0) {
          res.status(401).json({ error: 'Invalid username or password' });
          return;
        }
  
        res.send(result);
      });
  });

app.get("/getOrder", (req, res) => {
      sqlQuery = `SELECT * FROM orderdetail ;`;

      db.query(sqlQuery, (err, result) => {
        if (err) {
          console.error('Error submitting data:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
  
        if (result.length === 0) {
          res.status(401).json({ error: 'Invalid username or password' });
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
  
      db.query(sqlQuery, (err,result) => {
        if (err) {
          console.error('Error submitting data:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
  
        res.send(result)
      });
  });
  
app.post("/getId_Cart", (req, res) => {
    const {  Id_User} = req.body;
      sqlQuery = `SELECT Id_Cart FROM cart WHERE Id_User="${Id_User}";`;
  
      db.query(sqlQuery, (err, result) => {
        if (err) {
          console.error('Error submitting data:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
        res.send(result);
      });
  });

app.post("/order", (req, res) => {
    const {Id_Order,Id_User,Id_Product, Qty, Ttl_Belanja} = req.body;
    const sqlQuery1 = `INSERT INTO orderdetail (Id_Order, Id_Product, Qty, Ttl_Belanja) VALUES("${Id_Order}","${Id_Product}",${Qty},${Ttl_Belanja});`;
    const sqlQuery2 = `INSERT IGNORE INTO orders (Id_Order, Id_User,status,dataImage,batasorder) VALUES("${Id_Order}","${Id_User}","Proses Ongkir","","");`;
    const sqlQuery3 = `DELETE FROM cart WHERE Id_User="${Id_User}"`;
    const sqlQuery4 = `DELETE FROM cartdetail WHERE Id_User="${Id_User}"`;
  
      db.query(sqlQuery1, (err) => {
        if (err) {  
          console.error('Error submitting data:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
  
      });
      db.query(sqlQuery2, (err) => {
        if (err) {
          console.error('Error submitting data kedua :', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
  
      });
      db.query(sqlQuery3, (err) => {
        if (err) {
          console.error('Error submitting data ketiga:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
  
      });

      db.query(sqlQuery4, (err,result) => {
        if (err) {
          console.error('Error submitting data keempat:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
        console.log(result);
        res.status(200).json({ message: 'Data deleted successfully' });
      });
});

app.post("/user", (req, res) => {
    const { Username, Password} = req.body;
    sqlQuery = `SELECT * FROM user WHERE Username="${Username}" AND Password="${Password}";`;
  
      db.query(sqlQuery, (err, result) => {
        if (err) {
          console.error('Error submitting data:', err);
          res.status(500).json({ message: `${err}` });
          return;
        }
  
        if (result.length === 0) {
          res.status(401).json({ error: 'Invalid username or password' });
          return;
        }
  
        res.send(result);
      });
  });

app.post("/quantity", (req,res) =>{
    const {quantity, Id_User, Id_Produk} = req.body;
    const sqlUpdate = "UPDATE cartdetail SET Qty=? where Id_User=? AND Id_Product=?;";
    db.query(sqlUpdate, [quantity,Id_User,Id_Produk], (err,result) =>{
        if (err) {
            console.error('Error submitting data:', err);
            res.status(500).json({ message: 'Error submitting data' });
          } else {
            console.log(result);
            res.status(200).json({ message: 'Data update successfully' });
          }
    })
})

app.post("/update", (req,res) =>{
  const {Id_User,Username, Password, Email, Notelp, Alamat } = req.body;
  const sqlUpdate = `UPDATE user SET username="${Username}",password="${Password}",email="${Email}",notelp="${Notelp}",alamat="${Alamat}" where Id_User="${Id_User}"`;
  db.query(sqlUpdate,(err,result) =>{
      if (err) {
          console.error('Error submitting data:', err);
          res.status(500).json({ message: 'Error submitting data' });
        } else {
          console.log(result);
          res.status(200).json({ message: 'Data update successfully' });
        }
  })
})

app.post("/remover", (req,res) =>{
    const {Id_User, Id_Produk} = req.body;
    const sqlUpdate = "delete from cartdetail where Id_User=? AND Id_Product=?;";
    db.query(sqlUpdate, [Id_User,Id_Produk], (err,result) =>{
        if (err) {
            console.error('Error submitting data:', err);
            res.status(500).json({ message: 'Error submitting data' });
          } else {
            console.log(result);
            res.status(200).json({ message: 'Data update successfully' });
          }
    })
})

app.post("/checkout", (req,res) =>{
    const Id_Cart = req.body.Id_Cart;
    const Qty = req.body.Qty;
    const Id_User = req.body.Id_User;
    const Id_Product = req.body.Id_Product;
    const sqlInsert = "INSERT INTO cartdetail (Id_Cart,Qty,Id_User,Id_Product) VALUES(?, ?, ?, ?) ON DUPLICATE KEY UPDATE Qty = Qty + ?;";
    const sqlInsert1 = "INSERT IGNORE INTO cart VALUES(?, ?);";

    db.query(sqlInsert, [Id_Cart,Qty,Id_User,Id_Product,Qty], (err,result) => {
        if (err) {
            console.error('Error submitting data:', err);
            res.status(500).json({ message: 'Error submitting data' });
          } 
    })

    db.query(sqlInsert1, [Id_Cart,Id_User], (err,result) => {
      if (err) {
          console.error('Error submitting data:', err);
          res.status(500).json({ message: 'Error submitting data' });
        } else {
          console.log(result);
          res.status(200).json({ message: 'Data submitted successfully' });
        }
  })
})

const port = process.env.PORT || 5000;
app.listen(port, () =>{
    console.log(`Running on port ${port}`)
})