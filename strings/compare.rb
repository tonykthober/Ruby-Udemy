# https://ruby-doc.org/core-2.2.0/String.html

@a = 'string'
@b = 'string'

# puts "#{a}, showing string a" if a == b
def user_logged_in
	if @a == @b
	  puts "Welcome to your profile"
	else
	  puts "You need to log in to your account"
	end
end

user_logged_in`