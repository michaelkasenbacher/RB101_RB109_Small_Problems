def cleanup(string)
  string.gsub(/\W/, " ").gsub(/ +/, " ")
end

p cleanup("---what's my +*& line?") == ' what s my line '
