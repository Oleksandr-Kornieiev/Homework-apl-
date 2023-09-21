require 'net/http'
require 'json'

uri = URI('https://jsonplaceholder.typicode.com/posts')

data = {
  title: 'Новий пост',
  body: 'Щось',
  userId: 1
}

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
request.body = data.to_json

response = http.request(request)

if response.kind_of?(Net::HTTPSuccess)
  data = JSON.parse(response.body)
  puts "Відповідь сервера:\n#{data}"
else
  puts "Помилка: #{response.code} - #{response.message}"
end