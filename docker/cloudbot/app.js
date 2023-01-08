const http = require('http');
const os = require('os');
const handler = function(request, response) {
    response.writeHead(200);
    response.end("You've hit " + os.hostname() + "\n");
};

var www = http.createServer(handler);
www.listen(8089);

/*
    Authors:      Franklin D. <devsecfranklin@duck.com>
    Description:  
    Requirements: 
    NodeJS:       Version 
*/