my solution:
# if you want last number only, change to output[-3] 

def fibonacci(number)
  counter = 0
  output = [1, 1]

  while counter < number
    output << output[counter] + output[counter +1]
    counter += 1
  end

  output[0..-3]
end

p fibonacci(3)




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
1. 
fibonacci = Hash.new{ |h,k| h[k] = k < 2 ? k : h[k-1] + h[k-2] }

p fibonacci[6]
p fibonacci[50]

2.
def fib(n)
  (0..n).inject([1,0]) { |(a,b), _| [b, a+b] }[0]
end

3. 
FIBS = (1..100000).inject([0,1]){|arr| arr << arr.last(2).inject(:+)}

4.
def fibonacci_last_fast(n)
  fibonacci_repeating_sequence = determine_fibonacci_repeating_sequence
  index = (n - 1) % fibonacci_repeating_sequence.length
  fibonacci_repeating_sequence[index]
end

# Determine the repeated pattern in the fibonacci sequence
def determine_fibonacci_repeating_sequence
  last_digits = [1, 1]
  loop do
    next_last_digit = (last_digits[-2] + last_digits[-1]) % 10

    # If this condition is met, we know that the pattern will begin repeating
    if last_digits[-1] == last_digits[0] && next_last_digit == last_digits[1]
      return last_digits[0..-2]
    else
      last_digits << next_last_digit
    end
  end
end

p fibonacci_last_fast(1_000_000)

RB109

recursive solution (slow):
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

recursive solution (faster):
def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end