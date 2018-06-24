class Gyms::CLI

  def call
    get_zip
    menu
    goodbye 
  end

  def get_zip
    # doc (minus zip in URL): http://www.gymsandfitnessclubs.com/gyms-by-location/results.php?postal_code=94582
    puts ""
    puts "Gym Locator"
    puts ""
    puts "Enter zip code: "
    zip = gets.strip
    while zip.strip.length != 5 && zip.to_i.strip.class != Integer
      puts "Invalid entry"
      get_zip
    end
  end

  def menu
    puts "Enter gym number to get more details: "
    input = gets.strip

    while input > 0 && input < 11
      case input
      when "1"
        puts "More info on gym #1"
      when "2"
        puts "More info on gym #2"
      else
        puts "Invalid entry. Try again."
        menu
      end
    end
  end

  def goodbye
    "Thank you for using Gyms!"
  end

end
