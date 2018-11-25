class MyClass
# this is a line comment

#This is a local vairable
name = "Anthony"

#This is a Global Variable
@last_name = "Thober"

#This is a Global Variable
@middle_name = "Kenneth"

#This is a Constant Variable
FACEBOOK = "www.facebook.com"

puts name

end

class OtherClass < MyClass
  #This class inherates from MyClass
  
  puts last_name

end