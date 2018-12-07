system 'cls'

# 1. create the class
# 2. initiate the class
# 3. create the getter method
# 4. create the setter method

class Car
attr_accessor :make, :model, :year
# attr_reader = getter
# attr_writer = setter

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year    
  end

  
end

new_car = Car.new("Dodge", "Dakota", 2005)

new_car.make = "Nissan"
new_car.model = "Kicks"
new_car.year = 2018

p new_car.make
p new_car.model
p new_car.year