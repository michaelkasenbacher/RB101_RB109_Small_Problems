1.

input_text = File.read("madlibs.txt")

output_text = input_text.split.map do |word|
  format word, adjective: %w(quick lazy sleepy ugly).sample,
               noun: %w(fox dog head leg).sample,
               verb: %w(jumps lifts bites licks).sample,
               adverb: %w(easily lazily noisily excitedly).sample         
end

puts output_text.join(' ')

2.
def star(num)
  first_counter = num
  spacer = 2 + ((num - 7) / 2)
  empty = " "

  while spacer >= 0
    puts "*#{empty*spacer}*#{empty*spacer}*".center(num)
    first_counter -= 2
    spacer -= 1
  end

  puts "*" * num

  second_counter = 3
  spacer = 1
  empty = " "

  while second_counter < num
    puts "*#{empty*spacer}*#{empty*spacer}*".center(num)
    second_counter += 2
    spacer += 1
  end
end

star(11)

2. LS solution
def star(n)
  spaces = ' ' * (n / 2 - 1)
  line = "*#{spaces}*#{spaces}*"
  top_lines = [line]

  until spaces.empty?
    spaces.chop!
    line = "*#{spaces}*#{spaces}*".center(n)
    top_lines << line
  end

  puts [top_lines, ('*' * n), top_lines.reverse]
end

star(13)

3.
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  first = []
  matrix.map {|n| first << n[0] }
  second = []
  matrix.map {|n| second << n[1] }
  third = []
  matrix.map {|n| third << n[2] }
  result = [first] + [second] + [third]
end

new_matrix = transpose(matrix)


p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

3. LS solution
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    p new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

transpose(matrix)

4.
def transpose(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    p new_row = (0...number_of_rows).map {|row_index| matrix[row_index][column_index]}
    result << new_row
  end
  result
end

transpose([[1, 2, 3, 4]]) #== [[1], [2], [3], [4]]
# transpose([[1], [2], [3], [4]]) #== [[1, 2, 3, 4]]

5.
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).to_a.reverse.map {|row_index| matrix[row_index][column_index]}
    result << new_row
  end
  result
end

rotate90(matrix1)
rotate90(matrix2)
p new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

6.
def my_method(array)
  result = []
  
  if array.empty?
    result
  elsif array.size == 1
    result = [7 * array.first]
  else
    result = array.map {|num| num * num}
  end
  result
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# []
# [21]
# [9, 16]
# [25, 36, 49]

7.
def merge(a, b)
  size = a.size + b.size
  result = []
  a_counter = 0
  b_counter = 0

  size.times do
    if a[a_counter].to_i.integer? && b[b_counter].to_i.zero?
      result << a[a_counter]
      a_counter += 1
    elsif b[b_counter].to_i.integer? && a[a_counter].to_i.zero?
      result << b[b_counter]
      b_counter += 1
    elsif a[a_counter].to_i < b[b_counter].to_i
      result << a[a_counter]
      a_counter += 1      
    else
      result << b[b_counter]
      b_counter += 1
    end
  end 
  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

def merge_sort(arr)
  return arr if arr.size <= 1
    
  middle = arr.size / 2
  left = arr.slice(0...middle)
  right = arr.slice(middle..-1)
  
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)

  merge(sorted_left, sorted_right)

end

def merge(left, right)
  result = []
  until left.size == 0 || right.size == 0
    if left.first < right.first
      result << left.shift
    else
      result << right.shift
    end
  end
 
  result + left + right 
end

p merge_sort([6, 2, 7, 1, 4])

# egyptian
# student solution 1:

def egyptian(r)
  array = []
  counter = 1
  loop do 
    return array if r == 0
    if Rational(1, counter) <= r
      array << counter
      r -= Rational(1, counter)
    end
    counter += 1
  end

end

def unegyptian(e)
  total = 0
  e.each {|n| total += Rational(1, n)}
  total
end

# student solution 2:

def egyptian(rational)
  result = []
  i = 1

  while unegyptian(result) != rational
    result << i if unegyptian(result) + Rational(1, i) <= rational
    i += 1
  end
  result
end

def unegyptian(array)
  array.map { |n| Rational(1, n) }.sum
end