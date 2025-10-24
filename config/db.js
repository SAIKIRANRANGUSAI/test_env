const mysql = require("mysql2/promise");
require("dotenv").config();

const db = mysql.createPool({
  // host: process.env.DB_HOST,
  // user: process.env.DB_USER,
  // password: process.env.DB_PASSWORD,
  // database: process.env.DB_NAME,
  // port: process.env.DB_PORT || 3306,
  host: "46.250.225.169",
  user: "demo_colormo_usr",
  password: "QRdKdVpp3pnNhXBt",
  database: "my_loan_bazar",
  port: "3306",


});


module.exports = db;
