def arabic_to_roman(arabic)
  return '' if arabic < 0 || arabic > 4000
  arabic_values = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
  roman_numerals = %w[I IV V IX X XL L XC C CD D CM M]
  roman = ''
  index = arabic_values.length - 1
  while arabic > 0
    while arabic >= arabic_values[index]
      roman += roman_numerals[index]
      arabic -= arabic_values[index]
    end
    index -= 1
  end
  roman
end

def roman_to_arabic(roman)
  return 0 if roman.empty?
  arabic_values = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
  roman_numerals = %w[I IV V IX X XL L XC C CD D CM M]
  arabic = 0
  prev_value = 0
  roman.each_char do |symbol|
    value = arabic_values[roman_numerals.index(symbol)]
    if value
      if value > prev_value
        arabic += value - 2 * prev_value
      else
        arabic += value
      end
      prev_value = value
    else
      puts "Invalid Roman numeral: #{roman}"
      return nil
    end
  end
  arabic
end

def convert_again
  puts "Do you want to convert another number? [y/n]"
  convert_again = gets.chomp.downcase
  until %w[y n].include?(convert_again)
    puts "Wrong input. Please enter 'y' or 'n'."
    convert_again = gets.chomp.downcase
  end
  convert_again
end

loop do
  puts "Choose an option:
    1. Convert Arabic to Roman
    2. Convert Roman to Arabic
    3. Exit\nYour choice:\n"
  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Enter an Arabic number (1 <= n < 4000):"
    arabic = gets.chomp.to_i
    if arabic >= 1 && arabic < 4000
      roman = arabic_to_roman(arabic)
      puts "Roman numeral: #{roman}"
    else
      puts "Invalid input. Please enter a number between 1 and 3999."
    end
  when 2
    puts "Enter a Roman numeral:"
    roman = gets.chomp.upcase
    arabic = roman_to_arabic(roman)
    if arabic
      puts "Arabic number: #{arabic}"
    else
      puts "Conversion failed. Please try again."
    end
  when 3
    break
  else
    puts "Invalid choice. Please enter 1, 2, or 3."
  end

  break if convert_again == "n"
end