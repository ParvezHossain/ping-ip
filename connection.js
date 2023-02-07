const mysql = require("mysql2");
require("dotenv").config({path:'.env'});

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: "db",
});

module.exports = connection;