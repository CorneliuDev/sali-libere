require('dotenv').config({path: __dirname + '/database.env'})
const express = require('express');
const path = require('path');
const mysql = require('mysql');
const cron = require('node-cron');

const host = process.env.DB_HOST;
const user = process.env.DB_USER;
const pass = process.env.DB_PASS;
const db = process.env.DB_NAME;

var con = mysql.createConnection({
    host: host,
    user: user,
    password: pass,
    database: db,
    multipleStatements: true
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
        res.end();
    });
});

app.post('/updateRooms', function(req, res) {
    const {room, week, day, hour} = req.body;
    const sqlGet = `SELECT actual_rooms FROM free_rooms WHERE id_par=${week} AND id_zi=${day} AND id_ora=${hour}`;
    var fetched_data;
    con.query(sqlGet, function(err, result) {
        if(err) {
            console.log(err);
            res.json({ message: "error"});
        }
        fetched_data = result[0]['actual_rooms'].split(';');
        const index = fetched_data.indexOf(room);
        fetched_data.splice(index, 1);
        fetched_data = fetched_data.join(';');
    });
    setTimeout(() => {
        const sqlPut = `UPDATE free_rooms SET actual_rooms='${fetched_data}' WHERE id_par=${week} AND id_zi=${day} AND id_ora=${hour}`;
        con.query(sqlPut);
        res.end();
    }, 20);
});

app.post('/reset', function(req, res) {
    const {user, pass} = req.body;
    if(user == 'admin' && pass == 'admin') {
        const fs = require('fs');
        const sql = fs.readFileSync('../mariadbimage/init.sql', 'utf8');
        con.query(sql);
        res.send('success');
    }
    res.end();
});

cron.schedule('*/30 */2 * * 1-5', () => {
    const fs = require('fs');
    const sql = fs.readFileSync('../mariadbimage/init.sql', 'utf8');
    con.query(sql);
    console.log('took a reset');
});

app.listen(8080);