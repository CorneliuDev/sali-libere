const dotenv = require('dotenv');
const mysql = require('mysql');

dotenv.config();

const {
    DB_HOST,
    DB_USER,
    DB_PASS,
    DB_NAME
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