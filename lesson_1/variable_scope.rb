#Play around with variable scope and test out different scenarios.
#1 Create a local variable and modify it at an inner scope (in between a do/end block). You can try
#
#a) re-assigning the variable to something else
#b) call a method that doesn’t mutate the caller
#c) call a method that mutates the caller.
#2 Create a local variable at an inner scope (within a do/end block) and try to reference it
#in the outer scope. What happens when you have nested do/end blocks?


#local variable modified inside do/end
def multiply_array_by(number)
  local = []
  [1, 2, 3, 4].each do |element|
    local << element * number
  end
  local
end

my_string = "string"

#gsub does not mutate
my_string.gsub('r','')
puts my_string

#gsub! mutates
my_string.gsub!('r','')
puts my_string

def multiply_array_by(number)
  local = []
  [1, 2, 3, 4].each do |element|
    local << element * number
    inner_val = number
    puts inner_val
  end
  local
  inner_val # inner val here will return an undefine local variable error. not in scope
end

#multiply_array_by 9

#nested  do/ends the local variable at the outer block is visible in the inner block
[[1,2],[3,4]].each do |i|
  one = "read first array"
  i.each do |j|
    puts one
    two = "second array"
    puts two
    puts j
  end
end


