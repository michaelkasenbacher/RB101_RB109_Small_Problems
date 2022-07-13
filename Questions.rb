https://launchschool.com/exercises/690b2900

Question: why does the code only half work for invocations 2 and 3?

def crunch(string)
  arr = string.chars
  counter = 0

  loop do
    arr.delete_at(counter) if arr[counter] == arr[counter + 1]
    counter += 1
    break if counter == arr.length
  end

  p arr.join
end

crunch('ddaaiillyy ddoouubbllee')
crunch('4444abcabccba')
crunch('ggggggggggggggg')
crunch('a')
crunch('')

# Why does this p what it does?
p [1,2,3].map {|num| num << num}


# Why does is there an error message when within the while loop  
# `<main>': undefined method `<' for nil:NilClass (NoMethodError)

a = [1,5,9]
b = [2,6,8]

result = []
counter = 0

while counter <= a.size
  
  if a[counter] < b[counter]
    result << a[counter]
  else
    result << b[counter]
  end
  counter += 1
end

p result

# But no error message without the while loop? 

a = [1,5,9]
b = [2,6,8]
counter = 0
result = []

if a[counter].to_i < b[counter].to_i
  result << a[counter]
else
  result << b[counter]
end

p result