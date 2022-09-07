const express = require("express");

const {userSignUp,userSignIn,validateToken} = require("./authentication.controller");
const authenticationRouter = express.Router();
authenticationRouter.post("/api/signup", userSignUp);
authenticationRouter.post("/api/signin", userSignIn);
authenticationRouter.post("/api/validateToken",validateToken)
module.exports = {
  authenticationRouter,
};
