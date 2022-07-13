def sample(max_number)
  (1..max_number).to_a.sample
end

def guess_number(max_number, max_attempts)
  winning_number = sample(max_number)
  count_down = max_attempts
  attempts = 0
  
  puts "Number is between 0 and #{max_number+1}."
  puts "You have #{max_attempts} attempts."

  while attempts <= max_attempts

    puts 'Make a guess: '
      guess = gets.chomp.to_i
    
    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end

    puts "You have #{count_down -= 1} attempts remaining."
    attempts += 1
  end
end

guess_number(999, 9)
