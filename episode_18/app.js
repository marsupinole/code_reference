/*Mongoose has seen an extensive overhaul since Pedro published this episode, almost all code has changed.
You must build the mongo databases for the various models - follow the tutorial for the terminal commands.
*/

var express = require('express');
require('express-resource');
var fs = require('fs');
var MemStore = express.session.MemoryStore
var Mongoose = require("mongoose"), Schema = Mongoose.Schema;
var db = Mongoose.connect('mongodb://localhost/db')

var app = express.createServer();

app.configure('development', function () {
  app.use(express.logger());
  app.use(express.bodyParser()); //assigns a 'body' property to the request
  app.use(express.methodOverride());  //replaces any request methods with underscore methods. bodyParser needs to be 1st!
  app.use(express.static(__dirname + '/static'));
  app.use(express.cookieParser());
  app.use(express.session({ secret:'secret_key', store: MemStore( {
    reapInterval: 6000 * 10
  })}))
  app.use(express.errorHandler({
    dumpExceptions: true,
    showStack: true
  }));
});

app.configure('production', function () {
 app.use(express.logger());
  app.use(express.bodyParser()); //assigns a 'body' property to the request
  app.use(express.methodOverride());  //replaces any request methods with underscore methods. bodyParser needs to be 1st!
  app.use(express.static(__dirname + '/static'));
  app.use(express.cookieParser());
   app.use(express.session({ secret:'secret_key', store: MemStore( {
    reapInterval: 6000 * 10
  })}))
});

app.set('views', __dirname + '/views');
app.set('view engine', 'jade');

app.dynamicHelpers(
  {
    session: function(req, res){
      return req.session;
    },
    
    flash: function(req, res){
      return req.flash();
      }
     });

function requiresLogin(req, res, next){
  if (req.session.user){
    next();
    } else {
      res.redirect('/sessions/new?redir=' + req.url);
      }
    };

app.get('/', function(req, res) {
  res.render('root');
});

require('./users')
User = db.model('users')
require('./products');
Product = db.model('products');
var photos = require('./photos');

/*sessions*/

app.get('/sessions/new', function(req, res) {
  res.render('sessions/new', {locals: {
    redir: req.query.redir
  }});
});

app.post('/sessions', function(req, res){
  User.authenticate(req.body.login, req.body.password, function(user){
  if (user){
    req.session.user = user;
    res.redirect(req.body.redir || '/')
    } else {
      req.flash('warn', 'login failed')
      res.render('sessions/new', {locals: {redir: req.body.redir}});
    }
  })
});

app.get('/sessions/destroy', function(req, res){
  delete req.session.user;
      res.redirect('/'); 
});

/*products*/
app.get('/products', requiresLogin, function(req,res){
  Product.find(function(products){
    res.render('products/index', {locals: {
      products: products
    }});
  });
});

app.get('/products/new', requiresLogin, function(req, res){
  photos.list(function(err, photo_list){
    if (err){
      throw err;
  }
  res.render('products/new', {locals:{
    photos: photo_list,
    product: req.body && req.body.product || new Product
  }})
 });
});

app.post('/products', requiresLogin, function(req, res){
  var product = new Product(req.body.product);
  product.save(function(){
    res.redirect('/products/' + product._id.toHexString());
  });
});

app.get('/products/:id', function(req, res){
  Product.findById(req.params.id, function(product){
  res.render('products/show', {locals:{
    product: product
  }});
 });
});

app.get('/products/:id/edit', function(req, res){
  Product.findById(res.redirect('/products/' + id)).first(function(product){
  photos.list(function(err, photo_list){
    if (err){
      throw err;
  }
  res.render('products/edit', {locals:{
    product: product,
    photos: photo_list
    }});
   });
  });
});

app.put('/products/:id', requiresLogin, function(req, res){
  var id = req.params.id;
  Product.findById(id, function(product){
    product.name = req.body.product.name;
    product.description = req.body.product.description;
    product.price = req.body.price;
    product.photo = req.body.photo;
    product.save(function(){
      res.redirect('/products/' + product._id.toHexString);
    });
  });
});
/*photos*/

app.get('/photos', requiresLogin, function(req, res) {
  photos.list(function(err, photo_list) {
    res.render('photos/index', {locals: {
      photos: photo_list
    }})
  });
});

app.get('/photos/new', function(req, res) {
  res.render('photos/new');
});

app.post('/photos', function(req, res) {
  console.log(req.files.photo);
  var newFile =__dirname+'/static/uploads/photos/'+ req.files.photo.name;
    fs.rename(req.files.photo.path , newFile, function (data,error) {
    console.log(data); 
    if(error) {
      throw error;
    }
  });
    res.redirect('/photos');
});

app.listen(4000);