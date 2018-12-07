system 'cls'

# 1. create a user class
# 2. a user should have a first, last, and email
# 3. create a method to puts for each
# 4. create a superclass that is for admin user and put out "welcome to the admin panel"
# 5. create a superclass of paid users that puts "Welcome to the paid section"

class User
  attr_accessor :first_name, :last_name, :email

  def initialize(first_name: first_name, last_name: last_name, email: email)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end

  def user_info
    puts @first_name
    puts @last_name
    puts @email
  end
end

user = User.new(first_name: "Chipper", last_name: "Davis", email: "cdavis@gmail.com")



class AdminUser < User
  
  def admin
    return "Welcome to the admin panel"
  end
end

admin_user = AdminUser.new(first_name: "Chipper", last_name: "Davis", email: "cdavis@gmail.com")

puts admin_user.admin
puts admin_user.user_info


class PaidUser < User

  def paid
    return "Welcome to the paid section"
  end
end

paid_user = PaidUser.new(first_name: "Anthony", last_name: "Thober", email: "tonykthober@gmail.com")

puts paid_user.paid
puts paid_user.user_info
