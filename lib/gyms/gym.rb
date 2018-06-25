class Gyms::Gym
  attr_accessor :name, :url, :address1, :address2, :phone

  def self.get_local_gyms(zip)
    puts ""
    puts "Finding your gyms..."
    puts ""
    main_url = "http://www.gymsandfitnessclubs.com"
    http = "http://www.gymsandfitnessclubs.com/gyms-by-location/results.php?postal_code=#{zip}"
    doc = Nokogiri::HTML(open(http))

    # Invalid zip code ("Sorry" is found on webpage when invalid zip code is entered by user)
    if doc.search("#marquee_content").text.include?("Sorry")
      puts ""
      puts "* * * Invalid zip code. Try again. * * * "
      puts ""
      Gyms::CLI.new.call
    end

    gyms = []

    gym_1 = self.new
    gym_1.name = doc.search("#marquee_content").css("ul")[0].css("a strong").text.strip
    gym_1.url = doc.search("#marquee_content").css("ul")[0].css("a").attribute("href").text.strip

    gym_1_detail_doc = Nokogiri::HTML(open("#{main_url}#{gym_1.url}"))
    gym_1_data = gym_1_detail_doc.search("#marquee_content p").text

    gym_1.address1 = gym_1_detail_doc.search(".address1").text.strip
    gym_1.address2 = gym_1_detail_doc.search(".address2").text.strip
    gym_1.phone = /(\(\d{3}\) \d{3}-\d{4})/.match(gym_1_data)[1] #<-- do not change this index

    gyms << gym_1


    gym_2 = self.new
    gym_2.name = doc.search("#marquee_content").css("ul")[1].css("a strong").text
    gym_2.url = doc.search("#marquee_content").css("ul")[1].css("a").attribute("href").text

    gym_2_detail_doc = Nokogiri::HTML(open("#{main_url}#{gym_2.url}"))
    gym_2_data = gym_2_detail_doc.search("#marquee_content p").text

    gym_2.address1 = gym_2_detail_doc.search(".address1").text.strip
    gym_2.address2 = gym_2_detail_doc.search(".address2").text.strip
    gym_2.phone = /(\(\d{3}\) \d{3}-\d{4})/.match(gym_2_data)[1] #<-- do not change this index

    gyms << gym_2


    gym_3 = self.new
    gym_3.name = doc.search("#marquee_content").css("ul")[2].css("a strong").text
    gym_3.url = doc.search("#marquee_content").css("ul")[2].css("a").attribute("href").text

    gym_3_detail_doc = Nokogiri::HTML(open("#{main_url}#{gym_3.url}"))
    gym_3_data = gym_3_detail_doc.search("#marquee_content p").text

    gym_3.address1 = gym_3_detail_doc.search(".address1").text.strip
    gym_3.address2 = gym_3_detail_doc.search(".address2").text.strip
    gym_3.phone = /(\(\d{3}\) \d{3}-\d{4})/.match(gym_3_data)[1] #<-- do not change this index

    gyms << gym_3


    gym_4 = self.new
    gym_4.name = doc.search("#marquee_content").css("ul")[3].css("a strong").text
    gym_4.url = doc.search("#marquee_content").css("ul")[3].css("a").attribute("href").text

    gym_4_detail_doc = Nokogiri::HTML(open("#{main_url}#{gym_4.url}"))
    gym_4_data = gym_4_detail_doc.search("#marquee_content p").text

    gym_4.address1 = gym_4_detail_doc.search(".address1").text.strip
    gym_4.address2 = gym_4_detail_doc.search(".address2").text.strip
    gym_4.phone = /(\(\d{3}\) \d{3}-\d{4})/.match(gym_4_data)[1] #<-- do not change this index

    gyms << gym_4


    gym_5 = self.new
    gym_5.name = doc.search("#marquee_content").css("ul")[4].css("a strong").text
    gym_5.url = doc.search("#marquee_content").css("ul")[4].css("a").attribute("href").text

    gym_5_detail_doc = Nokogiri::HTML(open("#{main_url}#{gym_5.url}"))
    gym_5_data = gym_5_detail_doc.search("#marquee_content p").text

    gym_5.address1 = gym_5_detail_doc.search(".address1").text.strip
    gym_5.address2 = gym_5_detail_doc.search(".address2").text.strip
    gym_5.phone = /(\(\d{3}\) \d{3}-\d{4})/.match(gym_5_data)[1] #<-- do not change this index

    gyms << gym_5


    gym_6 = self.new
    gym_6.name = doc.search("#marquee_content").css("ul")[5].css("a strong").text
    gym_6.url = doc.search("#marquee_content").css("ul")[5].css("a").attribute("href").text

    gym_6_detail_doc = Nokogiri::HTML(open("#{main_url}#{gym_6.url}"))
    gym_6_data = gym_6_detail_doc.search("#marquee_content p").text

    gym_6.address1 = gym_6_detail_doc.search(".address1").text.strip
    gym_6.address2 = gym_6_detail_doc.search(".address2").text.strip
    gym_6.phone = /(\(\d{3}\) \d{3}-\d{4})/.match(gym_6_data)[1] #<-- do not change this index

    gyms << gym_6


    gym_7 = self.new
    gym_7.name = doc.search("#marquee_content").css("ul")[6].css("a strong").text
    gym_7.url = doc.search("#marquee_content").css("ul")[6].css("a").attribute("href").text

    gym_7_detail_doc = Nokogiri::HTML(open("#{main_url}#{gym_7.url}"))
    gym_7_data = gym_7_detail_doc.search("#marquee_content p").text

    gym_7.address1 = gym_7_detail_doc.search(".address1").text.strip
    gym_7.address2 = gym_7_detail_doc.search(".address2").text.strip
    gym_7.phone = /(\(\d{3}\) \d{3}-\d{4})/.match(gym_7_data)[1] #<-- do not change this index

    gyms << gym_7


    gym_8 = self.new
    gym_8.name = doc.search("#marquee_content").css("ul")[7].css("a strong").text
    gym_8.url = doc.search("#marquee_content").css("ul")[7].css("a").attribute("href").text

    gym_8_detail_doc = Nokogiri::HTML(open("#{main_url}#{gym_8.url}"))
    gym_8_data = gym_8_detail_doc.search("#marquee_content p").text

    gym_8.address1 = gym_8_detail_doc.search(".address1").text.strip
    gym_8.address2 = gym_8_detail_doc.search(".address2").text.strip
    gym_8.phone = /(\(\d{3}\) \d{3}-\d{4})/.match(gym_8_data)[1] #<-- do not change this index

    gyms << gym_8
  end

end
