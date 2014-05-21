#Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't
#specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about
#the vehicle that makes it different from other types of Vehicles.
#
#Then create a new class called MyTruck that inherits from your superclass that also has a constant defined
#that separates it from the MyCar class in some way.

class Vehicle
  def accelerate(mph)

  end

  def break(mph)

  end


end

class MyCar < Vehicle
  VIN = '1231NI098TRE'
end

class MyTruck < Vehicle
  VIN = '98UIILERGVB1'
end