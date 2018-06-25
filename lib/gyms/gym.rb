class Gyms::Gym
  attr_accessor :name, :url, :address1, :address2, :phone

  def self.get_local_gyms
    # I want to return a bunch of instances of gyms here (all local by input zip code)

    self.scrape_gyms
  end

  def self.scrape_gyms
    # Scrape http://www.gymsandfitnessclubs.com/gyms-by-location/results.php?postal_code=94582
    # and return gyms based on scraped data
    @zip = "94582"
    main_url = "http://www.gymsandfitnessclubs.com"
    http = "http://www.gymsandfitnessclubs.com/gyms-by-location/results.php?postal_code=#{@zip}"
    doc = Nokogiri::HTML(open(http))

    gyms = []

    gym_1 = self.new
    gym_1.name = doc.search("#marquee_content").css("ul")[0].css("a strong").text.strip
    gym_1.url = doc.search("#marquee_content").css("ul")[0].css("a").attribute("href").text.strip

    gym_1_detail_doc = Nokogiri::HTML(open("#{main_url}#{gym_1.url}"))
    gym_1_data = gym_1_detail_doc.search("#marquee_content p").text

    gym_1.address1 = gym_1_detail_doc.search(".address1").text.strip
    gym_1.address2 = gym_1_detail_doc.search(".address2").text.strip
    gym_1.phone = /(\(\d{3}\) \d{3}-\d{4})/.match(gym_1_data)[1]
    binding.pry


    gym_2 = self.new
    gym_2.name = doc.search("#marquee_content").css("ul")[1].css("a strong").text
    gym_2.url = doc.search("#marquee_content").css("ul")[1].css("a").attribute("href").text
    gym_2.address = "1244 Bollinger Blvd. San Ramon CA 94582"
    gym_2.phone = "925-999-4574"

    gyms
  end

end
