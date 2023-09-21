require 'net/http'
require 'json'

uri = URI('https://jsonplaceholder.typicode.com/posts?_limit=2')

response = Net::HTTP.get_response(uri)

if response.kind_of?(Net::HTTPSuccess)
  data = JSON.parse(response.body)
  data.each do |post|
    puts "Отримані дані:\n#{post.to_json}"
    puts "\n"
  end
else
  puts "Помилка: #{response.code} - #{response.message}"
end