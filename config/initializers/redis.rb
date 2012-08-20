$redis = Redis.new(:host => 'localhost', :port => 6379)

p "host:" + $redis.client.host.to_s
p "port:" + $redis.client.port.to_s

