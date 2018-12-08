system 'cls'


# The super keyword can be used to call a method of the same name in the superclass of the class making the call

class Car

  def color
    %q{Red}
  end
  
  def door_type
    %q{4 Door}
  end

  def wheel_type
    %q{AWD}
  end
end

class Truck < Car

  def color
    super
    # %q{Black}
  end
end

# new_car = Car.new()
# puts new_car.color

new_truck = Truck.new()
puts new_truck.color