const db = require('../connection');
const express = require('express'); 

exports.insertUser = (user, callback) => {
    db.query('INSERT INTO users SET ?', user, (err, result) => {
        if(err){
            callback(err, null);
      }
      else{
            callback(null, result)
      }
    });
}

exports.getUsers = (callback) => {

    var qry = `SELECT * FROM users`;
    db.query(qry,(err, result) => {
        if(err){
        callback(err, null);
      }
      else{
        callback(null, result)
      }
    });
}

exports.getUser = (user,callback) => {

    var qry = `SELECT * FROM users WHERE  id = ${user.id}`;
    db.query(qry,(err, result) => {
        if(err){
        callback(err, null);
      }
      else{
        callback(null, result)
      }
    });
}