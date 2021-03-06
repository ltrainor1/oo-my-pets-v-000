class Owner
  
  attr_accessor :pets, :name 
  attr_reader :species
  
  @@owners = []
  
  def initialize(species = "human", name)
    @species = species
    @name = name 
    @pets = {:fishes => [], :cats => [], :dogs => []}
    self.save 
end

  def say_species
    "I am a #{@species}."
  end 
  
  def save 
    @@owners << self 
  end 
  
  def self.all 
    @@owners 
  end 
  
  def self.count
    @@owners.size 
  end 
  
  def self.reset_all 
    @@owners.clear
  end 
  
  def buy_fish(name) 
    new_fish = Fish.new(name)
    pets[:fishes] << new_fish 
  end 
  
  def buy_cat(name) 
    new_cat = Cat.new(name)
    pets[:cats] << new_cat
  end 
  
  def buy_dog(name) 
    new_dog = Dog.new(name)
    pets[:dogs] << new_dog
  end 
  
  def walk_dogs 
    pets[:dogs].each {|dog| dog.mood = "happy"}
  end 
  
  def play_with_cats 
    pets[:cats].each {|cat| cat.mood = "happy"}
  end 
  
  def feed_fish 
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end 
  
  def sell_pets
    pets.each do |key, array|
      array.each {|pet| pet.mood = "nervous"}
      array.clear 
    end 
  end 
  
  def list_pets 
    fish_count = 0 
    cat_count = 0 
    dog_count = 0
    pets.each do |key, array|
       if key == :fishes 
         fish_count = array.length
        end 
      if key == :cats 
        cat_count = array.length 
      end 
      if key == :dogs 
        dog_count = array.length 
      end
    end 
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end 
  
end 