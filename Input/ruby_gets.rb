system "cls"

def name_app
  print "Enter your first name: "

  first_name = gets.capitalize.chomp.strip
    if first_name == ""
      puts "Please enter your first name"
      name_app
    else
      first_name_size = first_name.size

      puts "Welcome to the Console #{first_name}"

      puts "Your first name contains #{first_name_size} characters"
    end
end

name_app