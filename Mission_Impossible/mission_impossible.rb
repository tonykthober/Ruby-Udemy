system "cls"

# @var_a = 20
# @var_b = 20
# @var_c = "abc"

# def var_check
#   if @var_a == @var_b && @var_c == "abc"
#     return "Yes the vars are equal"
#   else
#     return "No, they are not equal"
#   end
# end

# p var_check

@safe_password = "VH3FS45L"
def safe_app
  print "Who is needing the safe code: "

  first_name = gets.capitalize.chomp.strip
    if first_name == ""
      puts "Please enter your first name"
      name_app
    else

      puts "Welcome #{first_name}, please enter your password: "

      password = gets.chomp.strip
      if password == "90op()POL"
        puts "Your code to the safe is #{@safe_password}, Good luck with your mission!"
      else
        puts "Incorrect, This message will self destruct in: "
        puts "5"
        sleep 1.2
        puts "4"
        sleep 1.2
        puts "3"
        sleep 1.2
        puts "2"
        sleep 1.2
        puts "1"
        sleep 1.2
        system "cls"
      end
    end
end

safe_app