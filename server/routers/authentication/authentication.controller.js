const User = require("../../models/user.mongo");
const bcrypt = require("bcryptjs");
const jwt = require('jsonwebtoken');


async function userSignUp(req, res) {
  console.log(req.body);
  const { name, email, password } = req.body;
    
  try {
    //Ensuring that the user has all the required parameters
    if (!password || !email || !name) {
      return res.status(400).json({ msg: "required parameter missing" });
    }

      let hashedPassword = await bcrypt.hash(password, 10)
      let newUser = new User({
          name,
          password: hashedPassword,
          email,
      });
      
    //validating the user i.e already signed or not
    const validate = await User.findOne({
      email: email,
    });
    if (validate) {
      return res.status(400).json({
        msg: "User with given email already exists",
      });
    }

 
    
    //saving newUser into database
    newUser.save((err, savedUser) => {
      if (err) {
        //return errors response if anything went wrong
        console.log(err);
        return res.status(400).json({
          msg:err.message,
        });
      }
      res.status(200).json({ savedUser });
    });
    console.log(`email: ${email} \n password: ${hashedPassword}\n name: ${name}`);
  
  }
  catch (err) {
    res.status(500).json({ error: err.message });
  }
}

 async function userSignIn(req, res) {
  try {
    const { email, password } = req.body
    const user = await User.findOne({ email: email });
    console.log("sign in", req.body);
    if (!user) {
      return res.status(400).json({ msg: 'Email not found' })
    }
    const validPassword = await bcrypt.compare(password, user.password)
    if (!validPassword)
    {
      return res.status(400).json({ msg: 'Incorrect password' })
    }
    const token = jwt.sign({ id: user._id }, "passwordKey")
    res.status(200).json({ token: token,...user._doc })

  }
  catch (err) { 
    return res.status(500).json({
      error:err.message
    })
  }
}
async function validateToken(req, res) {
  try {
    const token = req.header('x-authentication-token');
  if (!token)
  {
   return res.status(400).json(false)
  }
  const isVerified = jwt.verify(token, 'passwordKey');
  if (!isVerified)
  {
    return res.status(400).json(false);
  }
  const user = await User.findById(isVerified.id)
  if (!user)
  {
    return res.status(400).json(false);
  }
  res.status(200).json(true);
  } catch (error) {
    console.log(error);
    res.status(500).json({
      error: error.message
    })
  }
}
module.exports = {
  userSignUp,
  userSignIn,
  validateToken
};
