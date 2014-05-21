#Add an accessor method to your MyCar class to change and view the color of your car.
#Then add an accessor method that allows you to view,
#but not modify, the year of your car.

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

