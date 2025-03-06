require('dotenv').config({path: __dirname + '/database.env'})
const express = require('express');
const path = require('path');
const mysql = require('mysql');

const host = process.env.DB_HOST;
const user = process.env.DB_USER;
const pass = process.env.DB_PASS;
const db = process.env.DB_NAME;

var con = mysql.createConnection({
    host: host,
    user: user,
    password: pass,
    database: db
});

con.connect(function(err) {
    if (err) throw err;
    console.log('Connected to database!');
});

const app = express();

app.use(express.static(path.join(__dirname, '/')));
app.use(express.urlencoded({ extended: true }))
app.use(express.json());

app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, 'index.html'));

    // con.query(sql, function(err, result) {
    //     if (err) {
    //         console.log(err);
    //         res.redirect('/?register=failed');
    //     }
    //     res.redirect(`/?register=${result[0][0]['stat']}`);
    // });
});

app.post('/getFreeClassrooms', function(req, res) {
    const {week, day, hour} = req.body;
    const sql = `SELECT actual_rooms FROM free_rooms WHERE id_par=${week} AND id_zi=${day} AND id_ora=${hour}`;
    con.query(sql, function(err, result) {
        if(err) {
            console.log(err);
            res.json({ message: "error"});
        }
        res.json({ message: result});
        console.log(result);
        res.end();
    });
});

app.listen(8080);