const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const authRouter = express.Router();

// import { findOne } from 'mongoose'; // This help us with the mongoDB functions....



authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;
    //Here {name,email,password} is an map type object
    //get data from the user
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists" });
    }
    const hashedPassword = await bcryptjs.hash(password,8);//The next numerical degit is salt which will be added to the password.
    let user = new User({
      name,
      email,
      password: hashedPassword,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }

  //post the dareturn ta in database
  //return the data to the user
});

//signin Route
authRouter.post('/api/signin',async (req,res)=>{
  try{
    const {email,password}=req.body;
    const user = await User.findOne({email});
    if(!user){
      return res.status(400).json({msg:"User with this email does not exist"});
    }
    const isMatch = await bcryptjs.compare(password,user.password);
    if(!isMatch){
      return res.status(400).json({msg:"Incorrect password"});
    }
    const token = jwt.sign({id:user.id},"passwordKey");
    res.json({token,...user._doc});
  }catch(e){
    res.status(500).json({error:e.message});
  }
})

// With the below mentioned code we are mentioning that authRouter is not only a private Api it's now can be used by publicaly
module.exports = authRouter;
