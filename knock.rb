require 'socket'

target_host = ARGV[0]

for i in 1 ... ARGV.length
  port = ARGV[i]
  puts "Knocking on #{target_host}:#{port}"
  begin
    sleep 1
    socket = TCPSocket.new target_host, port
    socket.close
  rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
    next
  end
end