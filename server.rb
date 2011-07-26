require 'socket'

dts = TCPServer.new('localhost', 8080)

loop do
  Thread.start(dts.accept) do |s|
    print(s, " is accepted\n")
    s.write("HTTP/1.0 200 OK\n")
    sleep 1
    linger = [1,0].pack('ii')
    s.setsockopt(Socket::SOL_SOCKET, Socket::SO_LINGER, linger)
    s.close
    s.shutdown
  end
end
