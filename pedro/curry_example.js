var connect = require('connect')

connect.createServer(
  require('./curry_example2')(),
  require('./curry_example3')()
).listen(4000);
