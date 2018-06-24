class Gyms::Gym
  attr_accessor :name, :url, :address, :phone

  def self.local
    # I want to return a bunch of instances of gyms here (all local by input zip code)

    self.scrape_gyms
  end

  def self.scrape
    # Scrape http://www.gymsandfitnessclubs.com/gyms-by-location/results.php?postal_code=94582
    # and return gyms based on scraped data

    gyms = []
    gyms << self.scrape_gym

    gym_1 = self.new
    gym_1.name = "24 Hour Fitness"
    gym_1.url = "www.blahblahblah.com"
    gym_1.address = "1244 Alcosta Blvd. San Ramon CA 94582"
    gym_1.phone = "925-555-1234"

    gym_2 = self.new
    gym_2.name = "Cross Fit San Ramon"
    gym_2.url = "www.blahblahblah.com"
    gym_2.address = "1244 Bollinger Blvd. San Ramon CA 94582"
    gym_2.phone = "925-999-4574"

    gyms
  end

  def self.scrape_gym
    http = "http://www.gymsandfitnessclubs.com/gyms-by-location/results.php?postal_code=#{@zip}"
    doc = Nokogiri::HTML(open(http))
    binding.pry 
  end

end
