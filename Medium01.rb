1.

def rotate_array(arr)
  copy = arr.clone
  first = copy.shift
  copy.insert(-1, first)
  copy
  
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

2.
def rotate_rightmost_digits(num1, num2)
  arr = num1.digits.reverse
  rotated_number = arr.delete_at(-num2)
  arr.insert(-1, rotated_number)
  arr.join.to_i
  
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

3.
def max_rotation(num)
  arr = num.digits.reverse
  counter = 0
  
  while counter < arr.size
    rotated_number = arr.delete_at(counter)
    arr.insert(-1, rotated_number)
    counter += 1
  end
    
  arr.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

4.
def lights_on?(num)
  on = []
  1.upto(num) {|n| on << n}
  off = []
  round = 2

  while round <= num
    on_select = on.select{|n| n if n % round == 0}
    on = on.reject{|n| n if n % round == 0}

    off_select = off.select{|n| n if n % round == 0}
    off = off.reject{|n| n if n % round == 0}
    
    on += off_select
    off += on_select
    round += 1
  end
  
  on
end

p lights_on?(1000)

5.
def diamond(num)
  up_counter = 1
  down_counter = (num-2)
  
  while up_counter <= num
    puts "#{("*" * (up_counter)).center(num)}"
    up_counter += 2
  end

  while down_counter >= 1
    puts "#{("*" * (down_counter)).center(num)}"
    down_counter -= 2
  end
end

diamond(11)

5. extra
def diamond(num)
  up_counter = 1
  down_counter = num-4
  
  puts "*".center(num)
  while up_counter <= (num-2)
    puts "*#{" " * up_counter}*".center(num)
    up_counter += 2
  end

  while down_counter >= 1
    puts "*#{" " * down_counter}*".center(num)
    down_counter -= 2
  end
  puts "*".center(num)

end

diamond(17)

6.
def minilang(str)
  register = 0
  stack = []
  counter = 0
  arr = str.split

  while counter <= arr.size
    case
    when arr[counter] =~ /[0-9]/
      register = arr[counter].to_i
    when arr[counter] == "PUSH"
      stack.push(register)
    when arr[counter] == "DIV"
      register /= stack.pop
    when arr[counter] == "MULT"
      register = (stack.pop * register)
    when arr[counter] == "ADD"
      register = (stack.pop + register)
    when arr[counter] == "POP"
      register = stack.pop
    when arr[counter] == "PRINT"
      puts register
    else
    end
    counter += 1
  end
end

6. LS solution
def minilang(str)
  stack = []
  register = 0
  str.split.each do |token|
    case token
    when 'ADD'    then register += stack.pop
    when 'MULT'   then register *= stack.pop
    when 'PUSH'   then stack.push(register)
    when 'POP'    then register = stack.pop
    when 'PRINT'  then puts register
    else          register = token.to_i
    end
  end
end

7.
HASH = {"one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}

def word_to_digit(str)
  str = str.gsub(/\./, " .")
  arr = []
  str.split.each do |word| 
    if HASH.key?(word) == true
      arr << HASH[word]
    else
      arr << word
    end
  end
  str = arr.join(" ")
  str.gsub(/ \./, ".")
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

8.
def fibonacci(num)
  result = 0
  return 1 if num == 1
  return 1 if num == 2
  result = fibonacci(num - 1) + fibonacci(num -2)

end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

9.
def fibonacci_last(number)
  counter = 0
  output = [1, 1]

  while counter < number
    output << output[counter] + output[counter +1]
    counter += 1
  end

  output[-3]%10
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4