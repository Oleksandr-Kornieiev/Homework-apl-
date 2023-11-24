multiply1 = ->(x, y) { x * y}
result1 = multiply1.call(5, 2)
puts "Результат виконання лямбди = #{result1}"

def multiply2(x, y)
  yield(x, y)
end
multiply2(5, 2) do |a, b|
  result2 = a * b
  puts "Результат виконання блоку = #{result2}"
end

