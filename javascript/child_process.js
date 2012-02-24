var http = require('http');
var util = require('util');
var exec = require('child_process').exec;

var command = 'curl https://stream.twitter.com/1/statuses/sample.json?delimited=10 -ulieveton:<password>'

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  
  child = exec(command, function(error, stdout, stderr){});
  
  child.stdout.on('data', function(data) {
		console.log(data.toString());
		res.write(data);
	});
  
}).listen(1337, "127.0.0.1");



