
//creating an API
//Import from packages
const express = require("express");
const mongoose = require("mongoose");


//Import from others

const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
// INIT
const PORT=3000;
const app = express();
const DB = "mongodb+srv://debapriyo43:9748922606dD%40@cluster0.s0uxjfo.mongodb.net/?retryWrites=true&w=majority";
//middleware 
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);



mongoose.connect(DB).then(()=>{
    console.log("connection Successful");
}).catch((e)=>{
    console.log(e);
})
app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected to ${PORT}`);
});
// for commiting purposes 
// Testing Commit
/// Test 