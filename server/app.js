const express = require('express');
const app = express();
const cors=require('cors')
const morgan= require("morgan");
const { authenticationRouter } = require('./routers/authentication/authentication.router');
const { userRouter } = require('./routers/users/user.router');
app.use(cors())
app.use(express.json())
app.use(morgan('combined'));
app.use('/auth', authenticationRouter);
app.use('/user',userRouter);
module.exports = app;