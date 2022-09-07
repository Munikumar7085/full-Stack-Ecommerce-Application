const mongoose = require("mongoose");
const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    required: true,
    trim:true,
    validate: {
      validator: (value) => {
        const emailRegex = /([a-zA-Z0-9]+)([\_\.\-{1}])?([a-zA-Z0-9]+)\@([a-zA-Z0-9]+)([\.])([a-zA-Z\.]+)/g
          const result = value.match(emailRegex);
        return result;
      },
      message: "Not a valid email address",
    },
  },
    password: {
        type: String,
        required: true,
    },
    type:{
    type: String,
        default:""
    }
    ,
    address: {
        type: String,
        default:""
    }
    //TODO: add cart field
});
module.exports =mongoose.model("users",userSchema)