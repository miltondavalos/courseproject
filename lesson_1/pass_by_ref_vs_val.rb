#Pass by reference vs value
#
#Create a method that takes an array as a parameter. Within that method, try calling methods
#that do not mutate the caller. How does that affect the array outside of the method?
#What about when you call a method that mutates the caller within the method?
#end

#does not mutate
def take_array(array)
  array.sort
end

arr =  [1,2,3]
take_array(arr)
puts   arr

#it mutates
def pop_last_from_array(array)
  array.pop
end

arr =  [1,2,3]
pop_last_from_array(arr)
puts   arr