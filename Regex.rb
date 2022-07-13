# scan returns an array will all the occurances of text that matches the pattern.

str = "I'm at the end of a line."
str.split(/\b[AEIOUaeiou]\w*\b/) 
str.scan(/\b[AEIOUaeiou]\w*\b/)
#starts with word boundary [\b], followed by a vowel character [AEIOUaeiuou], and potentially [*] by any word character, and ends with a word boundary [\b]. 
["", "'m ", " the ", " ", " ", " line."]
["I", "at", "end", "of", "a"]

str = "I'm at the end of a line."
str.split(/\b[AEIOUaeiou]\w+\b/) 
str.scan(/\b[AEIOUaeiou]\w+\b/)
#starts with word boundary [\b], followed by a vowel character [AEIOUaeiuou], and at least one or many [+] word characters, and ends with a word boundary [\b]. 
["I'm ", " the ", " ", " a line."]
["at", "end", "of"]

str = "I'm at the end of a line."
str.split(/\b[AEIOUaeiou]\w?\b/) 
str.scan(/\b[AEIOUaeiou]\w?\b/)
#starts with word boundary [\b], followed by a vowel character [AEIOUaeiuou], and none or exactly one [?] word character, and ends with a word boundary [\b].
["", "'m ", " the end ", " ", " line."]
["I", "at", "of", "a"]

str = "I'm at the end of a line."
str.split(/\b[AEIOUaeiou]\w\b/) 
str.scan(/\b[AEIOUaeiou]\w\b/)
#starts with word boundary [\b], followed by a vowel character [AEIOUaeiuou], and exactly one word character, and ends with a word boundary [\b].
["I'm ", " the end ", " a line."]
["at", "of"]

str = "I'm at the end of a line."
str.split(/[AEIOUaeiou]/) 
str.scan(/[AEIOUaeiou]/)
#any vowel character [AEIOUaeiuou].
["", "'m ", "t th", " ", "nd ", "f ", " l", "n", "."]
["I", "a", "e", "e", "o", "a", "i", "e"]

str = "I'm at the end of a line."
str.split(/\w+/) 
str.scan(/\w+/)
#any word [w+]
["", "'", " ", " ", " ", " ", " ", " ", "."]
["I", "m", "at", "the", "end", "of", "a", "line"]

str = "I'm at the end of a line."
str.split(/a(?=t)/)
str.scan(/a(?=t)/)
# character 'a' followed by 't'
["I'm ", "t the end of a line."]
["a"]

str = "I'm at the end of a line."
str.split(/a(?!t)/)
str.scan(/a(?!t)/)
# character 'a' not followed by 't'
["I'm at the end of ", " line."]
["a"]

str = "I'm at the end of a line."
str.split(/a(?=[\s,])/)
str.scan(/a(?=[\s])/)
# character 'a' followed by whitespace. 
["I'm ", "t the end of a line."]
["a"]

str = "I'm at the end of a line."
str.split(/e(?=[\p{P}])/)
str.scan(/e(?=[\p{P}])/)
# character 'e' followed by punctuation character.  
["I'm at the end of a lin", "."]
["e"]

string = "word . Then the next"

string.split(/\s/)
string.scan(/\s/)
string.gsub(/\s/, "|")
["word", ".", "Then", "the", "next"]
[" ", " ", " ", " "]
"word|.|Then|the|next"


string = "word . Then the next"

string.split(/\s(?=t)/)
string.scan(/\s(?=t)/)
string.gsub(/\s(?=t)/, "|")
["word . Then", "the next"]
[" "]
"word . Then|the next"


string = "word , Then , the , next"
string.gsub(/ ,/, ',')
"word, Then, the, next"
#this subs " ," with ","

string = "word . Then . the . next"
string.gsub(/ ./, '.')
"word..hen..he..ext"
# this subs any character with "."

string = "word . Then . the . next"
string.gsub(/\./, '.')
"word . Then . the . next"
#this subs "." with "."

string = "word . Then . the . next"
string.gsub(/ \./, '.')
"word. Then. the. next"
#this subs " ." with "."

string = "word  . Then  . the  . next"
string.gsub(/ \./, '.')
"word . Then . the . next"
#same method as above. it subs one whitespace character only. 

string = "word  . Then     . the . next"
string.gsub(/ *\./, '.')
"word. Then. the. next"
#almost same method but this subs any amount of whitespace characters.

string = "word ! Then   ? the  , next"
string.gsub(/ *\p{P}/, '.')
"word. Then. the. next"
#this subs any whitespace and any following punctuations with "."

string = "word . Then . the . next"
string.gsub(/\s/, '.')
"word...Then...the...next"
#this subs whitespace with "."

string = "word . Then. the . next"
string.gsub(/\./, '..')
"word .. Then.. the .. next"
#this subs "." with ".."

string = "word . Then. the . next"
string.gsub(/\s(?=\.)/, '..')
"word... Then. the... next"
#this subs whitespace followed by "." with "."

string = "word ."
string.gsub(/\s(?=\.)/, '')
"word."
#this subs whitespace followed by "." with ""


str = "I'm word-word."
p str.split(/(\w+)/)



