1.
def interleave(arr1, arr2)
  arr = []
  counter = 0

  while counter < arr1.length
    arr << arr1[counter]
    arr << arr2[counter]
    counter += 1
  end
  arr

end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

2. 
def letter_case_count(str)
  lowercase = 0
  uppercase = 0
  neither = 0

  str.chars.map do |s|
    lowercase += 1 if /[a-z]/.match(s)
    uppercase += 1 if /[[:upper:]]/.match(s)
    neither += 1 if /[^A-Za-z]/.match(s)
  end

  arr = [[:lowercase, lowercase], [:uppercase, uppercase], [:neither, neither]]
  hsh = Hash[arr]
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

3.
def word_cap(str)
  arr = str.split()
  cap = arr.map {|s| s.capitalize}
  cap.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

4.
def swapcase(str)
  swap = str.chars.map do |s|
    if s.match(/[a-z]/)
      s.upcase 
    elsif s.match(/[A-Z]/)
      s.downcase
    else
      s
    end
  end
  swap.join
end



p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

5.
def staggered_case(str)
  arr = str.chars.map.with_index {|s, idx|
  if idx.odd?
    s.downcase
  else
    s.upcase
  end}
  arr.join("")

end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

6. 
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

6. alternative answer:
def staggered_case(str)
  i = -1

  str.gsub(/[a-zA-Z]/) do |letter|
    i += 1
    i.even? ? letter.upcase : letter.downcase
  end
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

7.
def show_multiplicative_average(arr)
  result = arr.inject(:*) / arr.length.to_f
  puts "The result is %0.3f" %result
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

8.
def multiply_list(arr1, arr2)
  counter = 0
  result = []
  
  while counter < arr1.length
    result << arr1[counter] * arr2[counter]
    counter += 1
  end
  result
  
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

9.
def multiply_all_pairs(arr1, arr2)
  arr = arr1.product(arr2)
  arr.map {|i, j| i*j}.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

10.
def penultimate(string)
  arr = string.split()
  arr[-2]
end


p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'