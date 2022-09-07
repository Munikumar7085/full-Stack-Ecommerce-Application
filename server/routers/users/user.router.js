const express = require('express');
const app = express();
const {getUserData,authorizeUser}=require('./user.controller')
const userRouter = express.Router();
console.log("userRouter called");
userRouter.get('/getData',authorizeUser, getUserData)
module.exports = {
    userRouter
}