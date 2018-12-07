system 'cls'



# begin

# puts 'abc' / 'cxd' NoMethodError

# rescue
#   puts "ERROR, ERROR, ERROR!!!!"

# end


# puts 0 + nil TypeError T 
# NameError

# begin
#   puts 0 + nil
# rescue TypeError => e
#   puts "This is an error message of type #{e} #{Time.now}"
# end


begin
  puts 'abc' / 'cxd'
rescue StandardError => e
  puts "This is an error message of type #{e} #{Time.now}"
end
