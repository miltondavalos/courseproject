#Add a class variable to your superclass that can keep track of the number of objects created that inherit from the
#superclass. Create a method to print out the value of this class variable as well.

#Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.
module Loadable
  attr_accessor :load

  def load_weight(lbs)
    puts "loaded #{lbs} lbs"
  end
end

class Vehicle

  @@number_of_vehicles = 0

  def initialize
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "Number of vehicles #{@@number_of_vehicles}"
  end

  def accelerate(mph)

  end

  def break(mph)

  end


end

class MyCars < Vehicle
  VIN = '1231NI098TRE'
end

class MyTrucks < Vehicle
  include Loadable

  VIN = '98UIILERGVB1'
end



t = MyTrucks.new
c = MyCars.new
t.load_weight(1000)
puts "#{t.load}"


Vehicle.number_of_vehicles

puts Vehicle.ancestors.to_s
puts MyTrucks.ancestors.to_s
puts MyCars.ancestors.to_s

