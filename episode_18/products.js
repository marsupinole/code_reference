var Mongoose = require("mongoose"),
    Schema = Mongoose.Schema;

var Product = new Schema({
    name: String,
    description: String,
    price: Number,
    photo: String,
});

var db = Mongoose.connect('mongodb://localhost/products')

Mongoose.model('products', Product);


  
        
