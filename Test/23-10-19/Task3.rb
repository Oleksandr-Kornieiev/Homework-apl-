def factorial(number)
  if number < 0
    puts "The factorial of a negative number is undefined."
    return "undefined"
  else if number == 0
         return 1
       else
         return number * factorial(number - 1)
       end
  end
end

def calculation_again
  puts "Do you want to calculate the factorial of another number? [y/n]"
  calculation_again = gets.chomp.downcase
  until %w[y n].include?(calculation_again)
    puts "Wrong input. Please enter 'y' or 'n'."
    calculation_again = gets.chomp.downcase
  end
  calculation_again
end

  loop do
    puts "Choose an option:
    1. Find the factorial of a number
    2. Exit\nYour choice:\n"
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "Enter the number:"
      number = gets.chomp.to_i
      puts "The factorial of #{number} is #{factorial(number)}"
    when 2
      break
    else
      puts "Invalid choice. Please enter 1, 2, or 3."
    end

    break if calculation_again == "n"
  end



