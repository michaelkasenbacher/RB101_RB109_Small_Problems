1.
def sum_of_sums(arr)
  sum = arr[0]
  counter = 1
  
  while counter < arr.length
    sum += arr[0..counter].sum
    counter += 1
  end
  sum
end


p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) #== 4
p sum_of_sums([1, 2, 3, 4, 5]) #== 35

2.
puts "Enter a noun:"
noun = gets.chomp

puts "Enter a verb:"
verb = gets.chomp

puts "Enter an adjective"
adjective = gets.chomp

puts "Enter an adverb:"
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

3.
def leading_substrings(str)
  arr = [str[0]]
  counter = 1

  while counter < str.length
    arr << str[0..counter]
    counter += 1
  end

  arr
  
end

p leading_substrings('abc') #== ['a', 'ab', 'abc']
p leading_substrings('a') #== ['a']
p leading_substrings('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

4.
def leading_substrings(str)
  arr = [str[0]]
  counter = 1

  while counter < str.length
    arr << str[0..counter]
    counter += 1
  end

  arr

end

def substrings(str)
  arr = []
  while str.length > 0
    arr << leading_substrings(str)
    str = str[1..-1]
  end
  arr.flatten
  
end

p substrings('abcde')

5.
def leading_substrings(str)
  arr = [str[0]]
  counter = 1

  while counter < str.length
    arr << str[0..counter]
    counter += 1
  end

  arr

end

def substrings(str)
  arr = []
  while str.length > 0
    arr << leading_substrings(str)
    str = str[1..-1]
  end
  arr.flatten
  
end


def palindromes(str)
  arr = substrings(str)
  pali = arr.select {|chars| chars if chars == chars.reverse && chars.length > 1}
end
  
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')

6.
def fizzbuzz(num1, num2)
  arr = []
  fb = []
  num1.upto(num2) {|num| arr << num}
  arr.each do |n|
    case 
    when n % 3 == 0 && n % 5 == 0
      fb << "FizzBuzz" 
    when n % 3 == 0
      fb << "Fizz"
    when n % 5 == 0
      fb << "Buzz"
    else
      fb << n
    end
  end
  fb.join(', ')
end

7.
def repeater(str)
  double = str.chars.map {|s| s * 2}
  double.join()
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

8.
def double_consonants(str)
  double = str.chars.map do |s|
    if s !~ /[BCDFGHJKLMNPQRSTVWXYZ]/i
      s
    else
      s * 2
    end
  end
  double.join()
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

9.
def reversed_number(num)
  num.digits.join.to_i
end


p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

10.
def center_of(str)
  arr = str.chars
  middle = arr.length / 2
  if arr.length.odd?
    arr[middle]
  else
    arr[middle-1] + arr[middle]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'