
//creating an API
//Import from packages

import express, { json } from "express";
import { connect } from 'mongoose'; // This help us with the mongoDB functions....

//Import from others

import authRouter from "./routes/auth.js";
// INIT
const PORT=3000;
const app = express();
const DB = "mongodb+srv://debapriyo43:9748922606dD@@cluster0.s0uxjfo.mongodb.net/?retryWrites=true&w=majority";
//middleware 
app.use(json())
app.use(authRouter);

//connections
connect(DB).then(()=>{
    console.log("connection Successful");
}).catch((e)=>{
    console.log(e);
})
app.listen(PORT,()=>{
    console.log(`connected to ${PORT}`);
});
// for commiting purposes 
// Testing Commit