module Loadable
  attr_accessor :load

  def load_weight(lbs)
    puts "loaded #{lbs} lbs"
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @@number_of_vehicles += 1
    @current_speed = 0
    @year = year
    @color = color
    @model = model
  end

  def self.number_of_vehicles
    puts "Number of vehicles #{@@number_of_vehicles}"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles/gallons} miles per gallon"
  end

  def to_s
    puts "color #{self.color}, year #{self.year}, model #{@model}"
  end

  def speed_up(speed)
    @current_speed += speed
    puts "You accelerated #{speed} mph"
  end

  def brake(speed)
    @current_speed -= speed
    puts "You hit the breaks and slow down #{speed} mph"
  end

  def shut_off
    @current_speed = 0
    puts 'Your car is now off'
  end

  def current_speed
    puts "You are driving #{@current_speed} miles an hour"
  end

  def spray_paint(color)
    self.color = color
  end

  def age
    calculate_age
  end

  private
  def calculate_age
    Time.now.year - self.year.to_i
  end
end

class MyCar < Vehicle
  VIN = '1231NI098TRE'
end

class MyTruck < Vehicle
  include Loadable

  VIN = '98UIILERGVB1'
end

z4 = MyCar.new('2014','Black', 'Convertible')
z4.speed_up(20)
z4.speed_up(5)
z4.current_speed
z4.brake(5)
z4.current_speed
z4.brake(20)
z4.current_speed
z4.shut_off
puts z4.color
z4.color = 'Blue'
puts z4.color
puts z4.year
#puts z4.year = '2015'      ->  Errors out.
z4.spray_paint 'Red'
puts z4.color


t = MyTruck.new(2012,'red', 'civic')
c = MyCar.new(2013,'black','corolla')

puts t.inspect

puts z4.age.to_s


