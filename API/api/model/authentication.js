const db = require('../connection');
const express = require('express'); 

exports.login = (user, callback) => {
    var qry = `SELECT * FROM users WHERE  email = '${user.email}' AND password = '${user.password}'`;
    db.query(qry,(err, result) => {
        if(err){
        callback(err, null);
      }
      else{
        callback(null, result)
      }
    });
}

