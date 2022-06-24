# # my solution:

# def fibonacci(number)
#   counter = 0
#   output = [1, 1]

#   while counter < number
#     output << output[counter] + output[counter +1]
#     counter += 1
#   end

#   output[0..-3]
# end

# p fibonacci(3)


LS solution:
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



# internet solutions:
1. apparently the best
fibonacci = Hash.new{ |h,k| h[k] = k < 2 ? k : h[k-1] + h[k-2] }

p fibonacci[6]
p fibonacci[50]

2.
def fib(n)
  (0..n).inject([1,0]) { |(a,b), _| [b, a+b] }[0]
end

3. 
FIBS = (1..100000).inject([0,1]){|arr| arr << arr.last(2).inject(:+)}

