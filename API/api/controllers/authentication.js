const express = require('express'); 
// Import user model
const userModel = require('../model/user');
// Import authentication model
const authModel = require('../model/authentication');

// Handle index actions
exports.index = function (req, res) {
    let user = {
        id : Number(req.params.id)
    }
    let result =  userModel.getUser(user,(error, result) => {
        if(error){
            res.status(500).json({
                message: "cannot get user"
            }) 
        }
        else{
            res.status(200).json({
                users: result
            })
        }
       });
};

// Handle login user info
exports.login = function (req, res) {
    let user = {
        email: req.body.email,
        password: req.body.password
    }
    let result =  authModel.login(user,(error, result) => {
        if(error){
            res.status(500).json({
                message: "cannot get user"
            }) 
        }
        else{
            res.status(200).json({
                users: result
            })
        }
       });
};

// Handle create user actions
exports.signUp = function (req, res) {

    let user = {
        id :req.body.id,
        name: req.body.name,
        email: req.body.email,
        password: req.body.password
    }
   let result =  userModel.insertUser(user, (error, result) => {
    if(error){
        res.status(500).json({
            message: "cannot create users"
        }) 
    }
    else{
        res.status(200).json({
            message: "user created"
        })
    }
   });
    
};

// Handle update user info
exports.update = function (req, res) {

};

// Handle delete user
exports.delete = function (req, res) {
    
};