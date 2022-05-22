# 1.

# age = rand(20..200)

# puts "Teddy is #{age} years old!"

# 2.

# puts "Enter the length of the room in meters:"
# length = gets.chomp.to_i

# puts "Enter the width of the room in meters:"
# width = gets.chomp.to_i

# square_meter = length * width
# square_feet = square_meter * 10.7639

# puts "The area of the room is #{square_meter} square meters (#{square_feet} square feet)."

# 3.

# puts "What is the bill?"
# bill = gets.to_f

# puts "What is the tip percentage?"
# tip_percentage = gets.to_f

# tip = (bill / 100) * tip_percentage
# total = bill + tip

# puts "The tip is $#{tip}"
# puts "The total is $#{total}"

# 4.

# puts "What is your age?"
# age = gets.to_i

# puts "At what age would you like to retire?"
# retirement_age = gets.to_i

# years_to_retirement = retirement_age - age

# time = Time.new
# year_now = time.strftime("%Y")

# year_of_retirement = year_now.to_i + years_to_retirement

# puts "
# It's #{year_now}. You will retire in #{year_of_retirement}.
# You have only #{years_to_retirement} years of work to go!
# "

# 5.

# puts "What is your name?"
# name = gets.chomp
# 
# if name.include? "!"
#   puts "HELLO #{name.upcase.chop} WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}"
# end

# 6.

# number = 0

# while number < 100
#   puts number if number.odd?
#   number += 1
# end

# 7.

# number = 0

# while number < 100
#   puts number if number.even?
#   number += 1
# end

# 8.

# puts "Please enter an integer greater than 0:"
# integer = gets.to_i
# array = []
# while integer > 0
#   array << integer
#   integer -= 1
# end

# puts "Enter 's' to compute the sum, 'p' to compute the product."
# answer = gets.chomp

# puts array.reduce(:+) if answer == "s"
# puts array.reduce(:*) if answer == "p"