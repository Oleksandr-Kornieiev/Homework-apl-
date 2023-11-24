class MyClass
  def multiply_by_two(number)
    puts "#{number} * 2 = #{number * 2}"
  end
  def method_missing(method_name, *args, &block)
    if method_name.start_with?("multiply_by")
      number = args[0]
      puts "#{number} * 2 = #{number * 2}"
    else
      super
    end
  end
end

example = MyClass.new
example.multiply_by_two(10)
example.multiply_by_2(10)