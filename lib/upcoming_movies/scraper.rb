class Scraper
    IMDB_URL = "https://www.imdb.com/"

    def self.scrape_imdb
        doc = Nokogiri::HTML(open(IMDB_URL))

        # binding.pry
        doc.css(".aux-content-widget-2")[0].css(".title").each do |movie_css|
            url = movie_css.css("a").attribute("href").value
            Movie.new(movie_css.text.strip).tap{|m| m.url = url}
        end  
    end

    def self.scrape_movie_details(movie)
        url = IMDB_URL + movie.url
        doc = Nokogiri::HTML(open(url))
        movie.description = doc.css("div.summary_text").text.strip
        binding.pry
    end
end