const jwt = require("jsonwebtoken");
const User = require("../../models/user.mongo");
function authorizeUser(req, res, next) {
  console.log(`authorize User called`);
    try {
        const token = req.header("x-authentication-token");
        if (!token) {
          return res.status(401).json({
            msg: "no authentication token, access denied",
          });
        }
        const verified = jwt.verify(token, "passwordKey");
        if (!verified) {
            return res.status(401).json(
                {
                  msg:"Token verification failed, access denied",
              }
          );
          }
          req.user = verified.id;
          req.token = token;
          next();
          
      } catch (error) {
        res.status(500).json({
          error: error.message,
        });
      }
}
async function getUserData(req, res, next) {
  const user = await User.findById(req.user)
  console.log(user);
    res.json({...user._doc,token: req.token})
    
}
module.exports = {
    getUserData,
    authorizeUser
};
