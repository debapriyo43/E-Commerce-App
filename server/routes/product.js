const express = require('express');
const productRouter = express.Router();
const auth = require('../middlewares/auth');
const product = require('../models/product');
productRouter.get("/api/products",auth,async(req,res)=>{
    try{
        console.log(req.query.category);
        const products = await product.find({category:req.query.category});
        res.json(products);
    }catch(e){
        res.status(500).json({error:e.message});
    }
    

});
//create a get request to search products and get them
productRouter.get("/api/products/search/:name",auth,async(req,res)=>{
    try{
        console.log(req.query.category);
        const products = await product.find({
            name:{$regex:req.params.name,$options:"i"}
        });
        res.json(products);
    }catch(e){
        res.status(500).json({error:e.message});
    }
    

});
//create a post request to rate the product
productRouter.post("/api/rate-product",auth,async(req,rest)=>{
    try{
        const {id,rating}=req.body;
        let product = await Product.findById(id);
        for(let i=0;i<product.rating.length;i++){
            if(product.ratings[i].userId==req.user){
                product.ratings.splice(i,1);
                break;
            }
        }
        const ratingSchema={
            userId:req.user,
            rating,
        };
        product.ratings.push(ratingSchema);
        product=await product.save();
        res.json(product);
    }catch(e){
        res.status(500).json({error:e.message});
    }
})

module.exports=productRouter;