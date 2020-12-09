class Owner
    attr_accessor :cats, :dogs
    attr_reader :species, :name
    @@all = []
    def initialize(name)
        @name= name
        @@all << self
        @species= "human"
        @cats= []
        @dogs= []
        @pets= []
        
    end
    def say_species
        "I am a #{self.species}."
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
        Cat.all.select do |cat| 
            cat.owner == self
        end
    end
    def dogs
        Dog.all.select do |dog| 
            dog.owner == self
        end
    end
    def buy_cat(name_of_cat)
        @cats << Cat.new(name_of_cat, self)
    end
    def buy_dog(name_of_dog)
        @dogs << Dog.new(name_of_dog, self)
    end
    def walk_dogs
        self.dogs.each do |dog|
            dog.mood = "happy"
        end
    end
    def feed_cats
        self.cats.each do |cat|
            cat.mood = "happy"
        end
    end
    def pets
        @pets << self.cats
        @pets << self.dogs
        @pets
    end
    def sell_pets
        self.dogs.each do |dog|
            dog.mood = "nervous"
            dog.owner = nil
        end
        self.cats.each do |cat|
            cat.mood = "nervous"
            cat.owner = nil
        end 
    end
    def list_pets
        "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
end




