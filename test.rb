def triangle(num)
  star = "*"
  counter = 0

  while counter <= num
    puts (star * counter).rjust(num)
    counter += 1
  end

end


triangle(5)

#     *
#    **
#   ***
#  ****
# *****
