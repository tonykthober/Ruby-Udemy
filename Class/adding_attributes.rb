system 'cls'

# 1. create the class
# 2. initiate the class
# 3. create the getter method
# 4. create the setter method

class Car
attr_accessor :make, :model, :year
# attr_reader = getter
# attr_writer = setter

  def initialize(make: make, model: model, year: year)
    @make = make
    @model = model
    @year = year    
  end

  def put_it_out
    puts @make
    puts @model
    puts @year
  end
end

new_car = Car.new(make: "Dodge", model: "Dakota", year: 2005)

p new_car.put_it_out