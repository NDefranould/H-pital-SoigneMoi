require('dotenv').config();
const usersModel = require('../models/users');

const usersController = {

    
    async signup(req, res, next) {

        
        const {lastname,firstname,address,email,password} = req.body;

        const result = await usersModel.signup(lastname,firstname,address,email,password);

        
        res.status(result.statusCode).json(result);
    },
};

module.exports = usersController;