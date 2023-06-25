const express = require("express");

const authRouter = express.Router();

authRouter.get("/user",(req,res)=>{
    res.json({msg:"debapriyo"});
});
// With the below mentioned code we are mentioning that authRouter is not only a private Api it's now can be used by publicaly
module.exports = authRouter;