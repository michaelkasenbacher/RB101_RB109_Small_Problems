def penultimate(string)
  arr = string.split()
  arr[-2]
end


p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

