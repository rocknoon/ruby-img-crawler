require 'socket'

s = TCPSocket.new('localhost', 2000);

s.puts('www.sina.com.cn');


while line = s.gets # Read lines from socket
  puts line         # and print them
end

s.close  
