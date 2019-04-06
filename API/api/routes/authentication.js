const express = require('express');
const router = express.Router();

const authController = require('../controllers/authentication');

router.get('/:id',(req,res)=> {
    authController.index(req, res);
});

router.post('/login', (req,res) => {
    authController.login(req, res);
});

router.post('/signup', (req,res) => {
    authController.signUp(req, res);
});

module.exports = router;