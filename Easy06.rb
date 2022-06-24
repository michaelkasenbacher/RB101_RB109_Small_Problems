1. 

DEGREE = "\xC2\xB0"

def dms(float)
  degrees = float
  minutes = ((float % 1) * 60)
  seconds = ((minutes % 1) * 60)
  angle = %(#{"%02d"%degrees.floor}#{DEGREE}#{"%02d"%minutes.floor}'#{"%02d"%seconds.floor}")
end

puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360)# == %(360°00'00") || dms(360) == %(0°00'00")

2.
def remove_vowels(arr)
  arr.map {|s| s.gsub(/[aeiouAEIOU]/, "")}
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

3. 
takes a while to run!

FIBS = (1..100000).inject([0,1]){|arr| arr << arr.last(2).inject(:+)}

def find_fibonacci_index_by_length(digits)
  selection = FIBS.select{|num| num.to_s.length >= digits }
  index = FIBS.index(selection.first)
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

LS solution is much quicker to run!
def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

p find_fibonacci_index_by_length(10000)

4.
def reverse!(arr)
  counter = 0
  counter_counter = -1

  loop do
    arr[counter], arr[counter_counter] = arr[counter_counter], arr[counter]
    counter += 1
    counter_counter -= 1

    break if counter == (arr.length) / 2
    break if arr.length == 0 || 1
  end

  arr
end

reverse!(list)

5.
def reverse(arr)
  p arr.object_id
  counter = -1
  new_arr = []
  
  while counter.abs <= arr.size
    new_arr << arr[counter]
    counter -= 1
    break if arr.size <= 1
  end
  
  p new_arr
  p new_arr.object_id
  p arr.object_id
end

list = [1,3,2]

reverse(list)

6.
def merge(arr1, arr2)
  arr = arr1 + arr2
  arr.uniq
end


p merge([1, 3, 5], [3, 6, 9])# == [1, 3, 5, 6, 9]


7.
def halvsies(arr)
  if arr.size >= 2
    split = ((arr.length)/2.to_f).ceil
    arr.each_slice(split).to_a
  else
    arr.partition.with_index { |_,i| i < 2 }
  end
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

8.
def find_dup(arr)
  arr.select {|item| arr.count(item) > 1}.uniq
end

p find_dup([1, 5, 3, 1]) #== 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) #== 73

9. 
def include?(arr, value)
  value_arr = Array[value]
  together = value_arr | arr
  together.sort == arr
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

10.
def triangle(num)
  star = "*"
  counter = 0

  while counter <= num
    puts (star * counter).rjust(num)
    counter += 1
  end

end


triangle(5)
