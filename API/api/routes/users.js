const express = require('express');
const router = express.Router();

const userController = require('../controllers/users');

router.get('/',(req,res)=> {
    userController.index(req, res);
});

router.get('/:id',(req,res)=> {
    userController.view(req, res);
});

router.post('/', (req,res) => {
    userController.new(req, res);
});

module.exports = router;