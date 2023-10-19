require 'prime'
#Хотів реалізувати метод Агравала—Каяла—Саксены,
#але щось час не розрахував, тому буде це,
#а як там із малою теоремою Ферма робити — вже не пам'ятаю,
#якщо є метод простіший, то я його теж забув,
#а просто перебирати всілякі дільники здається не дуже ефективно
def check_again
  puts "Do you want to check if another number is prime? [y/n]"
  check_again = gets.chomp.downcase
  until %w[y n].include?(check_again)
    puts "Wrong input. Please enter 'y' or 'n'."
    check_again = gets.chomp.downcase
  end
  check_again
end

loop do
  puts "Choose an option:
    1. Check for a prime number
    2. Exit\nYour choice:\n"
  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Enter the number:"
    number = gets.chomp.to_i
    if number < 2
      puts "#{number} is not a prime or a composite number."
    else if number.prime?
           puts "#{number} is a prime number."
         else
           puts "#{number} is a composite number."
         end
    end
  when 2
    break
  else
    puts "Invalid choice. Please enter 1, 2, or 3."
  end

  break if check_again == "n"
end