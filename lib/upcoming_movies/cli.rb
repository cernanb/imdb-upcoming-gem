class CLI
    def run 
        welcome 
        Scraper.scrape_imdb
        menu
        
    end
    
    def welcome
        puts "Welcome to upcoming movies!!!"
    end

    def menu 
        puts "Please select a movie to view the details:"
        list_movies
        input = gets.chomp.to_i
        movie = Movie.all[input - 1] 
        if movie.class == Movie
            Scraper.scrape_movie_details(movie)
        else
            puts "Invalid selection"
            self.menu
        end
    end 

    def list_movies 
        Movie.all.each.with_index(1) {|movie, index| puts "#{index}. #{movie.title}" }
    end 
end

