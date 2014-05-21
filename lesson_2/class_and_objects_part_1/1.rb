#Create a class called MyCar. When you initialize a new instance or object of the class,
#    allow the user to define some instance variables that tell us the year, color,
#    and model of the car. Create an instance variable that is set to 0
#during instantiation of the object to track the current speed of the car as well.
#Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :year, :color, :model

  def initialize(year, color, model)
    @current_speed = 0
    @year = year
    @color = color
    @model = model
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

