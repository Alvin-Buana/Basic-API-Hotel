const express = require('express');
const mysql = require('mysql');
const app = express();
const cors = require('cors');
const Pool = require('mysql/lib/Pool');
const { application } = require('express');

app.use(express.json());
const port = process.env.PORT || 8080;
app.listen(port,()=>{
    console.log(`Server is running on port ${port}`);
});

app.get('/',(req,res)=>{
    res.json({
        status:"Bark Bark ready to roll!"
    })
});
app.get('/list',(req,res)=>{
   const query = `SELECT * FROM hotel_dummy`; 
    pool.query(query,(err,result)=>{
        if(err){
            console.log(err);
            res.status(500).json({
                status:"error",
                message:err
            })
        }else{
            res.json({
                data:result
            })
        }
    });
});


app.get('/:breed',(req,res)=>{
    const query = "SELECT * FROM breed WHERE name = ?";
    pool.query(query,[req.params.breed],(err,results)=>{
        if (!results[0]){
            res.json({
                status:"No breed found"
            });
        }else{
            res.json(result[0]);
        }
    });
});

const pool = mysql.createPool({
    user:process.env.DB_USER,
    password:process.env.DB_PASS,
    database:process.env.DB_NAME,
    socketPath: `/cloudsql/${process.env.INSTANCE_CONNECTION_NAME}`,
});
