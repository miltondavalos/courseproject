class Cat

end

putty = Cat.new

module  CatBehaviour
    def meow
      puts "meow"
    end
end

class Cat
  include CatBehaviour
end

garfield = Cat.new
garfield.meow