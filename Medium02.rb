1.
string = <<~EOS
  Four score and seven years ago our fathers brought forth
  on this continent a new nation, conceived in liberty, and
  dedicated to the proposition that all men are created
  equal.

  Now we are engaged in a great civil war, testing whether
  that nation, or any nation so conceived and so dedicated,
  can long endure. We are met on a great battlefield of that
  war. We have come to dedicate a portion of that field, as
  a final resting place for those who here gave their lives
  that that nation might live. It is altogether fitting and
  proper that we should do this.

  But, in a larger sense, we can not dedicate, we can not
  consecrate, we can not hallow this ground. The brave
  men, living and dead, who struggled here, have
  consecrated it, far above our poor power to add or
  detract. The world will little note, nor long remember
  what we say here, but it can never forget what they
  did here. It is for us the living, rather, to be dedicated
  here to the unfinished work which they who fought
  here have thus far so nobly advanced. It is rather for
  us to be here dedicated to the great task remaining
  before us -- that from these honored dead we take
  increased devotion to that cause for which they gave
  the last full measure of devotion -- that we here highly
  resolve that these dead shall not have died in vain
  -- that this nation, under God, shall have a new birth
  of freedom -- and that government of the people, by
  the people, for the people, shall not perish from the
  earth.
EOS

def longest(sentence)
  arr = sentence.split(/[!?.]/)
  longest = arr.max_by {|s| s.split.size}
  
  puts "The longest sentence is: \n#{longest}."
  puts "It has #{longest.split.size} words."
  
end

longest(string)

1. longest word

string = <<~EOS
  Four score and seven years ago our fathers brought forth
  on this continent a new nation, conceived in liberty, and
  dedicated to the proposition that all men are created
  equal.

  Now we are engaged in a great civil war, testing whether
  that nation, or any nation so conceived and so dedicated,
  can long endure. We are met on a great battlefield of that
  war. We have come to dedicate a portion of that field, as
  a final resting place for those who here gave their lives
  that that nation might live. It is altogether fitting and
  proper that we should do this.

  But, in a larger sense, we can not dedicate, we can not
  consecrate, we can not hallow this ground. The brave
  men, living and dead, who struggled here, have
  consecrated it, far above our poor power to add or
  detract. The world will little note, nor long remember
  what we say here, but it can never forget what they
  did here. It is for us the living, rather, to be dedicated
  here to the unfinished work which they who fought
  here have thus far so nobly advanced. It is rather for
  us to be here dedicated to the great task remaining
  before us -- that from these honored dead we take
  increased devotion to that cause for which they gave
  the last full measure of devotion -- that we here highly
  resolve that these dead shall not have died in vain
  -- that this nation, under God, shall have a new birth
  of freedom -- and that government of the people, by
  the people, for the people, shall not perish from the
  earth.
EOS

def longest_word(str)
  arr = str.split
  longest = arr.max_by {|word| word.chars.size}
    
  puts "The longest word is: \n#{longest}"
  puts "It has #{longest.chars.size} characters."
  
end

longest_word(string)

2.
def block_word?(str)
  arr = [["B", "O"], ["X", "K"], ["D", "Q"], ["C", "P"], ["N", "A"], ["G", "T"], ["R", "E"],
        ["F", "S"], ["J", "W"], ["H", "U"], ["V", "I"], ["L", "Y"], ["Z", "M"]]  

  counter = 0
  word = ""
  upcase = str.upcase

  while counter <= str.size
    word += str[counter] if arr.flatten.include?(upcase[counter])
    arr.delete_if {|elements| elements.include?(upcase[counter])}
    counter += 1
  end
  word == str
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

3. one method
def letter_percentages(str)
  low = 0.0
  up = 0.0
  neither = 0.0
  
  str.chars.each do |i|
    low += 1 if i =~ /[a-z]/
    up += 1 if i =~ /[A-Z]/
    neither += 1 if i !~ /[A-Za-z]/
  end

  total = low + up + neither

  low_p = (low / total) * 100.0
  up_p = (up / total) * 100.0
  neither_p = (neither / total) * 100.0

  result = {lowercase: low_p, uppercase: up_p, neither: neither_p}
  
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

3. two methods
def letter_percentages(str)
  counting_results = letter_counting(str)
  
  low_p = (counting_results[0]/ counting_results[-1]) * 100.0
  up_p = (counting_results[1]/ counting_results[-1]) * 100.0
  neither_p = (counting_results[2]/ counting_results[-1]) * 100.0

  result = {lowercase: low_p, uppercase: up_p, neither: neither_p}
  
end

def letter_counting(str)
  low = 0.0
  up = 0.0
  neither = 0.0
   
  str.chars.each do |i|
    low += 1 if i =~ /[a-z]/
    up += 1 if i =~ /[A-Z]/
    neither += 1 if i !~ /[A-Za-z]/
  end
  total = low + up + neither
  result = [low, up, neither, total]
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

4.
def strip(str)
  stripped = str.chars.select {|i| i if i == "(" || i == ")"}
  str = stripped.join
  str.gsub(/\((?=\))(?<=\()\)/, "")
end

def balanced?(str)
  str = strip(str)

  if str == "" || str == "()"
    true
  else
    false
  end

end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

4. LS solution
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

5.
def triangle(num1, num2, num3)
  
  return :invalid if num1 <= 0 || num2 <= 0 || num3 <= 0
  return :invalid if (num1 + num2) < num3 || (num2 + num3) < num1 || (num3 + num1) < num2
  
  case 
  when num1 == num2 && num1 == num3
    :equilateral
  when num1 == num2 && num1 != num3 || num2 == num3 && num2 != num1 || num3 == num1 && num3 != num2
    :isosceles
  else
    :scalene
  end  
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

6.
def triangle(num1, num2, num3)
  
  return :invalid if num1 <= 0 || num2 <= 0 || num3 <= 0
  return :invalid if (num1 + num2 + num3) != 180
  
  case 
  when num1 == 90 || num2 == 90 || num3 == 90
    :right
  when num1 < 90 && num2 < 90 && num3 < 90
    :acute
  when num1 > 90 || num2 > 90 || num3 > 90
    :obtuse
  else
    
  end  
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

7.
require 'date'

def friday_13th(year)
  start_date = Date.new(year, 1, 1)
  end_date = Date.new(year, 12, 31)
  result = (start_date..end_date).to_a.select {|d| d.friday? && d.mday == 13}
  result.count  
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

7. extra
require 'date'

def five_fridays(year)
  start_date = Date.new(year, 1, 1)
  end_date = Date.new(year, 12, 31)
  all_fridays = (start_date..end_date).to_a.select {|d| d.friday?}
  fridays_per_month = all_fridays.map{|d| d.mon}
  hash = fridays_per_month.map.with_object({}) {|value, hash| hash[value] = fridays_per_month.count(value)}
  hash.select {|k,v| k if v > 4}.keys   
end

p five_fridays(2015)
p five_fridays(1983)
p five_fridays(2022)

8.
def featured(num)
  counter = num
  
  loop do
    counter += 1 # if counter += 14, it's 3x as fast
    break if counter % 7 == 0 && counter.odd? && counter.digits.find{|i| counter.digits.count(i) > 1} == nil
    break if counter.digits.size > 10
  end
  
  if counter.digits.size > 10
    return "There is no possible number that fulfills those requirements"
  else
    counter
  end
    
end

# p featured(12) #== 21
# p featured(20) #== 21
# p featured(21) #== 35
# p featured(997) #== 1029
# p featured(1029) #== 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)

9. 
def bubble_sort!(arr)
  arr.size.times do
    counter = 0 
    while counter <= (arr.size)-2
      if arr[counter] > arr[counter+1]
        arr[counter], arr[counter+1] = arr[counter+1], arr[counter]
      else
      end
      counter += 1
    end
  end
  arr
end

p bubble_sort!([5,3]) == [3, 5]
p bubble_sort!([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p bubble_sort!(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

10.
def sum_square_difference(num)
  ((1..num).inject(:+)**2) - ((1..num).inject {|sum, n| sum + n**2})
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150