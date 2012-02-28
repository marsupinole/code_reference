var express = require('express');

var app = express.createServer();


app.configure('development', function () {
  app.use(express.logger());
  app.use(express.bodyParser()); //assigns a 'body' property to the request
  app.use(express.methodOverride());  //replaces any request methods with underscore methods. bodyParser needs to be 1st!
  app.use(express.static(__dirname + '/static'));
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
  
});

app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
//app.set('view options', {layout: true});

app.get('/', function(req, res) {
  res.render('root');
});

var products = require('./products');

app.get('/products', function(req, res){
  res.render('products/index', {locals: {
    products: products.all
    }})
  })

app.get('/products/new', function(req, res){
    res.render('products/new', {locals: {
    product: req.body && req.body.product || products.new()
    }})
})
    
app.get('/products/:id', function(req, res){
  var product = products.find(req.params.id);  //the params object should have an id property
  res.render('products/show', {locals: {
  product: product
}});
});

app.get('/products/:id/edit', function(req, res){
    var product = products.find(req.params.id);
    res.render('products/edit', {locals: {
    product: product
    }})
})

app.put('/products/:id', function(req, res){
  var id = req.params.id;
  products.set(id, req.body.product)
  res.redirect('/products/'+id);
  })

app.post('/products/', function(req, res){
  var id = products.insert(req.body.product)
    res.redirect('/products/' + id)
    }) 


app.listen(4000);
