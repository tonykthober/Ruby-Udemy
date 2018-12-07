system 'cls'

# 1. create the class
# 2. initiate the class
# 3. create the getter method
# 4. create the setter method

class Car
  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year    
  end

  def make
    @make
  end

  def make=(make)
    @make = make
  end

  def model
    @model
  end

  def model=(model)
    @model = model
  end

  def year
    @year
  end

  def year=(year)
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