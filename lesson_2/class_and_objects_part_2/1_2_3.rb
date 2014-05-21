#Add a class method to your MyCar class that calculates the gas mileage of any car.

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @current_speed = 0
    @year = year
    @color = color
    @model = model
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
end

MyCar.gas_mileage(10, 410)

corvette = MyCar.new(2014, 'white', 'corvette')

corvette.to_s

class Person
  #attr_reader :name
  attr_accessor :name


  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

