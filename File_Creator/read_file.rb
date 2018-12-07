system 'cls'

name_list = File.read('files/name.txt')
email_list = File.read('files/email.txt')

# puts name_list
# puts email_list

name_array = name_list.split
email_arrary = email_list.split

# puts name_array[0]
# puts email_arrary[0]

name_array.each do |name|
  puts name.upcase
end

email_arrary.each do |email|
  puts email
end