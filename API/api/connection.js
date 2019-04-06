const mysql = require('mysql');
const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    passowrd: "",
    database: "Test"
});

connection.connect( err => {
    console.log(err);
})

module.exports = connection;