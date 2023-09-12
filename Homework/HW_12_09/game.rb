loop do
  puts "First player's choice"
  user1_input = STDIN.gets.chomp.downcase
  while user1_input != "stone" && user1_input != "scissors" && user1_input != "paper" do
    puts "The first player wrote the wrong answer"
    user1_input = STDIN.gets.chomp.downcase
  end

  puts "Second player's choice"
  user2_input = STDIN.gets.chomp.downcase
  while user2_input != "stone" && user2_input != "scissors" && user2_input != "paper" do
    puts "The second player wrote the wrong answer"
    user2_input = STDIN.gets.chomp.downcase
  end

  if user1_input == "stone"
    if user2_input == "scissors"
      puts "The first player won"
    elsif user2_input == "stone"
      puts "Nobody won"
    else
      puts "The second player won"
    end

  elsif user1_input == "scissors"
    if user2_input == "paper"
      puts "The first player won"
    elsif user2_input == "scissors"
      puts "Nobody won"
    else
      puts "The second player won"
    end

  else
    if user2_input == "stone"
      puts "The first player won"
    elsif user2_input == "paper"
      puts "Nobody won"
    else
      puts "The second player won"
    end
  end

  puts "Do you want to play again? [y/n]"
  play_again = STDIN.gets.chomp.downcase
  while play_again != "y" && play_again != "n"
    puts "Wrong input"
    play_again = STDIN.gets.chomp.downcase
  end

  break if play_again == "n"
end