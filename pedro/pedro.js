var express = require('express');
var form = require('connect-form')
var formidable = require("formidable");
var fs = require('fs');

var products = require('./products');
var photos = require('./photos');

var app = express.createServer();
var MemStore = require('connect').session.MemoryStore;

app.configure('development', function () {
  app.use(express.logger());
  app.use(express.bodyParser()); //assigns a 'body' property to the request
  app.use(express.methodOverride());  //replaces any request methods with underscore methods. bodyParser needs to be 1st!
  app.use(express.static(__dirname + '/static'));
  app.use(express.cookieParser());
  app.use(express.session({        secret: 'secret_key',        store : MemStore({            reapInterval : 60000*10        })    }))
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
 app.use(express.session({        secret: 'secret_key',        store : MemStore({            reapInterval : 60000*10        })    }))
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

users = require('./users');

app.get('/sessions/new', function(req, res) {
  res.render('sessions/new', {locals: {
    redir: req.query.redir
  }});
});

app.post('/sessions', function(req, res){
  users.authenticate(req.body.login, req.body.password, function(){
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

app.get('/products', requiresLogin, function(req, res){
  res.render('products/index', {locals: {
    products: products.all
    }})
  })

app.get('/products/new', requiresLogin, function(req, res){
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

app.get('/products/:id/edit', function(req, res) {
  var product = products.find(req.params.id);
  photos.list(function(err, photo_list) {
    if (err) {
      throw err;
    }
    res.render('products/edit', {locals: {
      product: product,
      photos: photo_list
    }});
    
  });
});

app.put('/products/:id', function(req, res){
  var id = req.params.id;
  products.set(id, req.body.product)
  res.redirect('/products/'+id);
  })

app.post('/products/', function(req, res){
  var id = products.insert(req.body.product)
    res.redirect('/products/' + id)
    }) 

app.get('/photos', function(req, res) {
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
