require 'net/http'
require 'uri'
require 'pp'

url = URI.parse('http://localhost:8080/')

begin 
  Net::HTTP.start(url.host, url.port) do |http|
    http.get('/')
  end
rescue Exception=>e
  pp e
end
