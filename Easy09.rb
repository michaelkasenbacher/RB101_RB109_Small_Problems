1.

def greetings(arr, hsh)
  puts "Hello #{arr.join(" ")}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

2.
def twice(num)
  if double?(num) == true
    num
  else
    num * 2
  end
end

def double?(num)
  arr = num.digits.reverse
  middle = arr.length / 2
  first_half = []
  second_half = []
  arr.map.with_index do |n, idx|
    if idx >= middle
    second_half << n
    else
    first_half << n
    end
  end
  first_half == second_half
end


p twice(37) #== 74
p twice(44) #== 44
p twice(334433) #== 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

2. LS solution
def twice(num)
  str_num = num.to_s
  center = str_num.size / 2
  left_side = center.zero? ? "" : str_num[0..center-1]
  right_side = str_num[center..-1]
  
  return num if left_side == right_side
  return num * 2
  
end


# p twice(37) #== 74
# p twice(44) #== 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) #== 10

3.
def negative(num)
  num.abs * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

4.
def sequence(num)
  arr = []
  counter = 1

  while counter <= num
    arr << counter
    counter += 1
  end

  arr
  
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

5.
def uppercase?(str)
  arr = str.chars
  arr.all? {|i| i !~ /[a-z]/}
  
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

6.
def word_lengths(str)
  result = []
  arr = str.split()
  arr.map {|i|
    result << "#{i} #{i.size.to_s}"
  }
  result
end


p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

7.
def swap_name(str)
  arr = str.split
  arr.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

8.
def sequence(num1, num2)
  arr = []
  counter = 1

  while counter <= num1
    arr << num2 * counter
    counter += 1
  end

  arr
end

p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) #== [-7, -14, -21, -28]
p sequence(3, 0) #== [0, 0, 0]
p sequence(0, 1000000) == []

9.
def get_grade(one, two, three)
  average = (one + two + three) / 3
  case
  when average >= 90
    "A"
  when average >= 80
    "B"
  when average >= 70
    "C"
  when average >= 60
    "D"
  else
    "F"  
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

10.
def buy_fruit(arr)
  arr.map {|a,b| [a]*b}.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

11.
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

word_counter = 0
arr_counter = 0
all_results = []

while word_counter < words.size
  arr_counter = 0
  results = []

  while arr_counter < words.size
    if words[word_counter].chars.sort.join == words[arr_counter].chars.sort.join
      results << words[arr_counter]
    else
    end
    arr_counter += 1
  end
  all_results << results
  word_counter += 1
end

p all_results.uniq

10. LS solution
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

result = {}

words.each do |word|
  key = word.split("").sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end


result.each_value do |v|
  puts "-----"
  p v
end

10. alternative solution
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

  def group_anagrams(arr)
    grouped_array = []
    arr.each do |word|
      grouped_array << arr.select{|arr_word| word.chars.sort == arr_word.chars.sort}
    end
    grouped_array.uniq
  end

  p group_anagrams(words)