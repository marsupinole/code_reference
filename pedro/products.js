var products = [
{
  id: 1,
  name: 'macbook',
  description: 'laptop',
  price: 1000
},

{
  id: 2,
  name: 'ipad',
  description: 'apple ipad',
  price: 900
},

];

module.exports.all = products

module.exports.find = function(id){
  id = parseInt(id, 10);
  var found = null;
  productloop: for(index in products){
    var product = products[index];
      if (product.id == id){
        found = product;
        break productloop;
      }
    };
    return found;
    }

module.exports.set = function(id, product){
  id = parseInt(id, 10);
  product.id = id;
  products[id - 1] = product;
  };
  
  module.exports.new = function(){
    return{
      name: '',
      description: '',
      price: ''
      }
    }
    
  module.exports.insert = function(product){
    var id = products.length+1;
    product.id = id
    products[id - 1] = product;
    return id;
  };
  
  
        
