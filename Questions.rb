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

Why does this p what it does?
p [1,2,3].map {|num| num << num}