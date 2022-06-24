1. 
def ascii_value(input)
  value = input.chars.map {|char| char.ord}
  value.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

2.
def time_of_day(time)
  days = time.abs / (60 * 24)
    if days >= 1
      hours = (time.abs - (60 * 24 * days)) / 60
    else
      hours = time.abs / 60
    end
  minutes = time.abs % 60
    
  hours = 23 - hours if time < 0
  minutes = 60 - minutes if time < 0

  display_time = "#{"%02d" % hours}:#{"%02d" % minutes}"
  display_time
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800) == "13:20"
p time_of_day(-4231)

2. with .devmod

def time_of_day(num)

  days = num.abs.divmod(60 * 24)
  hours_and_minutes = days[1].divmod(60)
  if num < 0
    hours_and_minutes[0] = 23 - hours_and_minutes[0]
    hours_and_minutes[1] = 60 - hours_and_minutes[1]
  else
  end
  display_time = "#{"%02d" %hours_and_minutes[0].to_i}:#{"%02d" %hours_and_minutes[1].to_i}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437) == "00:03"
p time_of_day(3000)
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

3.
def after_midnight(str)
  arr = str.partition(":")
  minutes = arr[0].to_i * 60 + arr[2].to_i
  if minutes >= 1440
    minutes = 0
  else
    minutes
  end
end

p after_midnight('12:34')
p after_midnight('00:00')
p after_midnight('24:00')

def before_midnight(str)
  arr = str.partition(":")
  minutes = 1440 - (arr[0].to_i * 60 + arr[2].to_i)
  if minutes >= 1440
    minutes = 0
  else
    minutes
  end
end

p before_midnight('12:34')
p before_midnight('00:00')
p before_midnight('24:00')

4.
def swap_first_last_characters(word)
word[0], word[-1] = word[-1], word[0]
word
end

def swap(words)
result = words.split.map do |word|
  swap_first_last_characters(word)
end
result.join(" ")
end


p swap('Oh what a wonderful day it is')

4. alternative solution
def swap(string)

  string.split.each {|word| word[0], word[-1] = word[-1], word[0]}.join(" ")
  end

p swap('Oh what a wonderful day it is')

5.
def cleanup(string)
  string.gsub(/\W/, " ").gsub(/ +/, " ")
end

p cleanup("---what's my +*& line?") == ' what s my line '

6. 
def word_sizes(string)
  arr = string.split
  word_sizes = arr.map {|word| word.size}
  hsh = word_sizes.each_with_object({}) {|value, hash| hash[value] = word_sizes.count(value)}
  hsh.sort_by {|key| key}.to_h
end


p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

7.
def word_sizes(string)
  arr = string.gsub(/[[:punct:]]/, "").split
  word_sizes = arr.map {|word| word.size}
  hsh = word_sizes.each_with_object({}) {|value, hash| hash[value] = word_sizes.count(value)}
  hsh.sort_by {|key| key}.to_h
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

8. 

HASH = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
  6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven",
  12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen",
  17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}

def alphabetic_number_sort(num)
  
  hsh = num.to_h{|n| [n, HASH[n]]}
  sorted = hsh.sort_by {|k, v| v }.to_h.keys
  
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

8. alternative
NUMBER_WORDS = %w(zero one two three four
  five six seven eight nine
  ten eleven twelve thirteen fourteen
  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

9. 
def crunch(string)
  arr = string.chars
  selection = ""
  index = 0

  while index <= string.length
    selection << string[index] unless arr[index] == arr[index + 1]
    index += 1
  end

  p selection
end

crunch('ddaaiillyy ddoouubbllee')
crunch('4444abcabccba')
crunch('ggggggggggggggg')
crunch('a')
crunch('')

9.
def print_in_box(s)
  if s.length < 3
    length = 2
  else
    length = s.length
  end

  line = "-" * length
  empty_line = " " * length

  puts <<~LINE
  +#{line}+
  |#{empty_line}|
  |#{s.center(length)}|
  |#{empty_line}|
  +#{line}+
  LINE

end

print_in_box('To boldly go where no one has gone before.')
print_in_box("")

