#You want to create a nice interface that allows you to accurately
#describe the action you want your program to perform. Create a method called spray_paint that can be
#called on an object and will modify the color of the car.

class MyCar
  attr_accessor :color
  attr_reader :year

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

  def spray_paint(color)
    self.color = color
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
puts z4.color
z4.color = 'Blue'
puts z4.color
puts z4.year
#puts z4.year = '2015'      ->  Errors out.
z4.spray_paint 'Red'
puts z4.color

