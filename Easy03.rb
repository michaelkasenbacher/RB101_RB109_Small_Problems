1.

numbers = []

puts "1st number"
numbers << gets.to_i

puts "2nd number"
numbers << gets.to_i

puts "3rd number"
numbers << gets.to_i

puts "4th number"
numbers << gets.to_i

puts "5th number"
numbers << gets.to_i

puts "6th number"
last_number = gets.to_i

puts "The last number is included in the previous numbers" if numbers.include?(last_number) == true
puts "The last number is not included in the previous numbers" if numbers.include?(last_number) != true

2.

puts "Enter the first number:"
number1 = gets.to_i

puts "Enter the second number:"
number2 = gets.to_i

puts addition = number1 + number2
puts subtraction = number1 - number2
puts product = number1 * number2
puts quotient = number1 / number2
puts remainder = number1 % number2
puts power = number1 ** number2

3. 

puts "Please write word or multiple words:"
input = gets.chomp

input_no_whitespace = input.gsub(/\s+/, '')
puts input_no_whitespace.length

4.

def multiply(num1, num2)
  num1 * num2
end

multiply(5, 3)

5.

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(-5)

6.

def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

p xor?(3.odd?, 4.odd?)
p xor?(3.odd?, 4.even?)

7.

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

p oddities([2, 3, 4, 5, 6])

8.

def palindrome?(word)
  word.reverse
  if word == word.reverse
    true
  else
    false
  end
end

p palindrome?('madam')
p palindrome?('Madam')

9.

def palindrome?(word)
  word.reverse
  if word.downcase.delete("^a-zA-Z0-9") == word.reverse.downcase.delete("^a-zA-Z0-9")
    true
  else
    false
  end
end

p palindrome?('madam')
p palindrome?('Madam')
p palindrome?("Madam, I'm Adam")

10.

def palindrome?(number)
  if number.to_s == number.to_s.reverse
    true
  else
    false
  end
end

p palindrome?(34543)
p palindrome?(123210)
