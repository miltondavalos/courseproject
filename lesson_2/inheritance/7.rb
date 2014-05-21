# Create a class 'Student' with attributes name and grade.
# Do NOT make the grade getter public, so joe.grade will raise an error.
# Create a better_grade_than? method, that you can call like so...

#puts "Well done!" if joe.better_grade_than?(bob)

class Student
  attr_accessor :name
  #attr_writer :grade

  def initialize (name)
    @name = name
  end

  def better_grade_than?(who)
    return false if self.grade <= who.grade
    true
  end


  def grade=(grade)
    @grade = grade
  end

  protected
  def grade
    @grade
  end
end

joe = Student.new('joe')
bob = Student.new('bob')
joe.grade = '80'
bob.grade = '75'
puts "Well done!" if joe.better_grade_than?(bob)