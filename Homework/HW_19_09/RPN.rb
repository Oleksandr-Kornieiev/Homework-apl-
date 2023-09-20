def convert_to_rpn(expression)
  precedence = { '+' => 0, '-' => 0, '*' => 1, '/' => 1 }
  output = []
  operators = []

  characters = expression.split
  prev_character_was_operator = false
  characters.each do |character|
    if character =~ /\d+/
      output << character
      prev_character_was_operator = false
    elsif character =~ /[+\-\*\/]/
      if prev_character_was_operator
        puts "Two consecutive operators without an operand"
        return
      end
      while operators.any? &&
        operators.last =~ /[+\-\*\/]/ &&
        precedence[operators.last] >= precedence[character]
        output << operators.pop
      end
      operators << character
      prev_character_was_operator = true
    elsif character == '-' && !prev_character_was_operator #Перевірка на від'ємне число
      output << character
    elsif operators.empty?
      puts "It's not an elementary mathematical operator OR" +
             "It's a set of numbers, not a mathematical expression"
      return
    end
  end
  while operators.any?
    output << operators.pop
  end
  output.join(' ')
end

loop do
  puts "Enter a mathematical expression in the usual form" +
         "(with spaces between characters and without brackets):"
  input_expression = STDIN.gets.chomp
  output_expression = convert_to_rpn(input_expression)
  if output_expression
    puts "Result in Reverse Polish Notation:"
    puts output_expression
  end
  puts "Do you want to repeat the conversion? [y/n]"
  convert_again = STDIN.gets.chomp.downcase
  while convert_again != "y" && convert_again != "n"
    puts "Wrong input"
    convert_again = STDIN.gets.chomp.downcase
  end
  break if convert_again == "n"
end