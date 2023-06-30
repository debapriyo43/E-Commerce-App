import { Router } from "express";
import User from "../models/user.js";
// import { findOne } from 'mongoose'; // This help us with the mongoDB functions....


const authRouter = Router();

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
    let user = new User({
      name,
      email,
      password,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }

  //post the dareturn ta in database
  //return the data to the user
});
// With the below mentioned code we are mentioning that authRouter is not only a private Api it's now can be used by publicaly
export default authRouter;
