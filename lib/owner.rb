class Owner
  @@all = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
    @all_cats = []
    @all_dogs = []
    @cats = []
    @dogs = []
  end
  
  def name
    @name
  end
  
  def species
    @species
  end
  
  def say_species
    "I am a human."
  end
  
  def self.all 
    @@all
  end
  
  def self.count
    @@all.length 
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats 
    @all_cats = Cat.all.select{|x| x.owner == self}
    return @all_cats
  end
  
  def dogs 
    @all_dogs = Dog.all.select{|x| x.owner == self}
    return @all_dogs
  end 
  
  def buy_cat(name)
    @cat = Cat.new(name, self)
  end
    
  def buy_dog(name)
    @dog = Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.select do |x|
      if x.owner == self 
        x.mood = "happy"
      end
    end
  
  def feed_cats
    Cat.all.select do |x|
      if x.owner == self
        x.mood = "happy"
      end
    end
  end
  
  def sell_pets
    Cat.all.select do |x|
      if x.owner == self
        x.mood = "nervous"
        x.owner = nil
      end
    end
    Dog.all.select do |x|
      if x.owner == self
        x.mood = "nervous"
        x.owner = nil
      end
    end
  end
    
  def list_pets
    Cat.all.select do |x|
      if x.owner == self
        @cats << x 
      end
    end
    Dog.all.select do |x|
      if x.owner == self
        @dogs << x 
      end
    end
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
    
end
