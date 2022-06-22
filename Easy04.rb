# 1.

# def short_long_short(str1, str2)
#   if str1.length < str2.length
#     str1+str2+str1
#   else
#     str2+str1+str2
#   end
# end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

# 2.

# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 = 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end

# def leap_year?(year)
#   case year
#   when year % 4 == 0
#     true
#   else
#     false
#   end
# end

# 3. 

# def leap_year?(year)
#   case
#   when (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)
#     true
#   when (year % 4 == 0) && (year % 100 == 0)
#     false
#   when (year % 4 == 0)
#     true
#   else
#     false
#   end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true


# 4.
# def leap_year?(year)
#   if (year % 400 == 0) && (year > 1752) 
#     true
#   elsif (year % 100 == 0) && (year > 1752)
#     false
#   elsif year % 4 == 0
#     true
#   else
#     false
#   end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

# 5.
# def multisum(num)
#   counter = 0
#   sum = 0

#   while counter <= num
#     if (counter % 3).zero?
#       sum += counter
#     elsif (counter % 5).zero?
#       sum += counter
#     else
#       sum
#     end
#     counter += 1
#   end
#   sum
# end

# p multisum(3)
# p multisum(5)
# p multisum(8)
# p multisum(10)
# p multisum(1000)

# 5. more concise

# def multisum(number)
#   (0..number).select {|num| (num % 3).zero? || (num % 5).zero?}.sum
# end

# p multisum(1000)

# 6. solution 1

# def running_total(arr)
#   sum = 0
#   arr.map {|value| sum += value}
# end

# p running_total([2, 5, 13])

# 6. solution 2

# def running_total(array)
#   array.map.with_index do |element, idx|
#     array[0..idx].sum
#   end
# end

# p running_total([2, 5, 13])

# 7. 

# DIGITS = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9}

# def string_to_integer(string)
#   p digits = string.chars.map { |char| DIGITS[char]}
  
#   value = 0
#   digits.each {|digit| value = 10 * value + digit}
#   value
# end

# p string_to_integer('4321')

# 7 extra: hexadecimal_to_integer

# DIGITS = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15}

# def hexadecimal_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char.downcase]}
  
#   digits.reverse!
  
#   value = 0
#   digits.each_with_index {|num, idx| value += num * 16 ** idx}
#   value
# end

# p hexadecimal_to_integer('4D9f')

# 8. 
# DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "+" => 0, "-" => 0}

# def string_to_signed_integer(string)
#   digits = string.chars.map { |char| DIGITS[char]}
  
#   value = 0
#   digits.each {|digit| value = 10 * value + digit}
  
#   value = value * -1 if string.chars[0] == '-'
#   value

# end


# p string_to_signed_integer('4321')
# p string_to_signed_integer('-570')
# p string_to_signed_integer('+100')

8. alternative
DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9}

def string_to_signed_integer(string)
  case string[0]
  when "-" then -string_to_integer(string[1..-1])
  when "+" then string_to_integer(string[1..-1])
  else string_to_integer(string)
  end
end

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char]}
  
  value = 0
  digits.each {|digit| value = 10 * value + digit}
  value

end


p string_to_signed_integer('4321')
p string_to_signed_integer('-570')
p string_to_signed_integer('+100')

9.
DIGITS = {0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"}


def integer_to_string(int)
 value = int.digits.reverse!
 value = value.map {|num| DIGITS[num]}
 value.join
end

p integer_to_string(4321)
p integer_to_string(5000)
p integer_to_string(0)

10.
DIGITS = {0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"}


def integer_to_string(int)
 value = int.digits.reverse!
 value = value.map {|num| DIGITS[num]}
 value.join
end

def signed_integer_to_string(num)
  if num > 0
    "+#{integer_to_string(num)}"
  elsif num < 0
    "-#{integer_to_string(num.abs)}"
  else
    integer_to_string(num)
  end
end

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)


