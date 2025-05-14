const dotenv = require('dotenv');
const express = require('express');
const path = require('path');
const mysql = require('mysql');
const cron = require('node-cron');
const fs = require('fs');

dotenv.config();

const {
    DB_HOST,
    DB_USER,
    DB_PASS,
    DB_NAME,
    HTTP_PORT
} = process.env;

var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASS,
    database: DB_NAME,
    multipleStatements: true
});

con.connect(function(err) {
    if (err) throw err;
    console.log('Connected to database!');
    process.exit(0);
});

con.on('error', (err) => {
    console.error(err);
});

const app = express();

app.use(express.static(path.join(__dirname, '/website_files')));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

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
        const sqlPut = `UPDATE free_rooms SET actual_rooms='${fetched_data}' WHERE id_par=${week} AND id_zi=${day} AND id_ora=${hour}`;
        con.query(sqlPut);
        res.status(204).end();
    });
});

app.post('/reset', function(req, res) {
    const {user, pass} = req.body;
    if(user == 'admin' && pass == 'admin') {
        const sql = fs.readFileSync(__dirname+'/mariadbimage/init.sql', 'utf8');
        con.query(sql);
        res.send('success');
    }
    else res.send('failed');
});

cron.schedule('0 0 * * 0', () => {
    const sql = fs.readFileSync(__dirname+'/mariadbimage/init.sql', 'utf8');
    con.query(sql);
    console.log('took a reset');
});

app.listen(HTTP_PORT);