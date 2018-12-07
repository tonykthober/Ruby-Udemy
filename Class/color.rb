system 'cls'

# 1. create the class
# 2. initiate the class
# 3. create the getter method
# 4. create the setter method
# 5. create set age method
# strftimer.com
# https://ruby-doc.org/stdlib-2.3.1/libdoc/date/rdoc/DateTime



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

  def get_the_year
    @current_time = Time.now.strftime("%Y").to_i
    @car_age_neg = @year - @current_time
    @car_age = @car_age_neg * -1
    puts "This truck is #{@car_age} years old"
  end

end

new_car = Car.new(make: "Dodge", model: "Dakota", year: 2005)

new_car.put_it_out
new_car.get_the_year

class Color < Car

  def color
    return "Black"
  end
end


color = Color.new()

puts color.color