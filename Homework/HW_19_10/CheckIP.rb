require 'ipaddr'

def validate_with_regex?(ip)
  octet = ip.split(".")
  return false unless octet.length == 4

  octet.each do |octet|
    return false unless octet.match?(/^\d+$/) && #без цього .to_i повертатиме 0, якщо прийме нечислове значення, а 0 нам підходить
                        octet.to_i >= 0 && octet.to_i <= 255
  end

  true
end

def validate_with_ipaddr?(ip)
  begin
    IPAddr.new(ip)
    true
  rescue IPAddr::InvalidAddressError
    false
  end
end

def check_again
  puts "Do you want to check another IPv4? [y/n]"
  check_again = gets.chomp.downcase
  until %w[y n].include?(check_again)
    puts "Wrong input. Please enter 'y' or 'n'."
    check_again = gets.chomp.downcase
  end
  check_again
end

loop do
  puts "Choose an option:
    1. Validate without gem
    2. Validate with IPAddr gem
    3. Exit\nYour choice:"
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter an IPv4 address: "
    ip = gets.chomp
    puts validate_with_regex?(ip)
  when 2
    print "Enter an IPv4 address: "
    ip = gets.chomp
    puts validate_with_ipaddr?(ip)
  when 3
    break
  else
    puts "Invalid choice. Please enter 1, 2, or 3."
  end

  break if check_again == "n"
end