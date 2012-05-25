require 'socket'               # Get sockets from stdlib
require 'digest'
require './core'
require './threadpool'

server = TCPServer.new(2000)  # Socket to listen on port 2000
pool   = ThreadPool.new(10);

loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  
  
  pool.process {
    c = client;
	line = c.gets();
	uri = line.chomp();
	rtn = aContent(uri);
	  
	c.puts rtn;
	c.close                 # Disconnect from the client
  }
  
  
}
