# 1. 

# def repeat(string, int)
#   string = string + " "
#   puts string * int
# end


# repeat('Hello', 3)

# 2.

# def is_odd?(num)
#   p num % 2 != 0
# end

# is_odd?(4)
# is_odd?(-1)
# is_odd?(9)

# 3.

# def digit_list(num)
#   num.digits.reverse
# end

# puts digit_list(12345)

# 4.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
# freq = Hash.new(0)
# vehicles.each { |x| freq[x] += 1 }
# puts freq.map{ |key, value| "#{key} #{value}x" } 

# 5.

# def reverse_sentence(sentence)
#   sentence = sentence.split(" ").reverse!.join(" ")
# end

# puts reverse_sentence('Hello World')
# puts reverse_sentence('Reverse these words')

# 6.

# def reverse_words(sentence)
#   words = []

#   sentence.split.each do |word|
#     word.reverse! if word.size >=5
#     words << word
#   end

#   words.join(" ")
# end

# puts reverse_words('Professional')         
# puts reverse_words('Walk around') 
# puts reverse_words('Launch School')

# 7.

# def stringy(value)
#   array = []

#   1.upto(value) do |digit|
#     array << 1 if digit.odd?
#     array << 0 if digit.even?
#   end

#   print array.join
  
# end


# puts stringy(6)
# puts stringy(9)
# puts stringy(4)
# puts stringy(7)

# 8.

# def average(numbers)
#   numbers.sum / numbers.size
# end

# puts average([1, 6]) 
# puts average([1, 5, 87, 45, 8, 8])
# puts average([9, 47, 23, 95, 16, 52])

# 9.

# def sum(number)
#   number.digits.sum
# end


# puts sum(23)
# puts sum(496)
# puts sum(123_456_789)

# 10.

# def calculate_bonus(salary, boolean)
#   if boolean == true 
#     bonus = salary / 2
#   else
#     bonus = 0
#   end
# end

# puts calculate_bonus(2800, true)
# puts calculate_bonus(1000, false)
# puts calculate_bonus(50000, true)