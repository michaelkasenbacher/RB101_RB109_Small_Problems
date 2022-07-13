def century(num)
  p c = num.fdiv(100)
  p c.ceil
  p c.to_i.ordinal
end





century(2000) #== '20th'
# p century(2001) #== '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# p century(5) #== '1st'
# p century(10103) #== '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'