var users = {
  'pedro' : {login: 'pedro', password: 'test1', role: 'admin'},
  'john' : {login: 'john', password: 'test1', role: 'user'},
  'mike' : {login: 'mike', password: 'mike', role: 'user'} 
  };
  
  module.exports.authenticate = function(login, password, callback){
    user = users[login];
    if(!user){
      callback(null);
      return;
      }
      if (user.password == password){
      callback(user);
      return;
    }
    callback(null);
    };
