
def car_list(*cars)
  puts cars
end

car_list("Ford", "Dodge", "Chevy", "Tesla")

def used_cars(**used_list)
  used_list.each do |make, year|
    puts "Make: #{make}"
    puts "Year: #{year}"
  end
end

this_is_data = {
  "Nissan": "2018",
  "Dodge": "Dakota",
  "Tesla": "2016"
}

used_cars this_is_data

def sold_cars(options={})
  puts options[:make]
  puts options[:model]
  puts options[:year]
end

sold_cars(make: "Ford", model: "Explorer", year: 2012)