class Movie
    attr_accessor :title, :url, :rating, :runtime, :description, :director
    @@all = []

    def initialize(title)
        self.title = title
        self.save
    end 

    def self.all
        @@all 
    end 

    def save 
        self.class.all << self 
    end 
end