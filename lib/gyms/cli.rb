require 'pry'
class Gyms::CLI

  def call
    title
    menu
    goodbye
  end

  def title
    puts ""
    puts "Gym Locator"
    puts ""
  end

  def get_zip
    puts "Enter zip code: "
    input = gets.strip
    if input.length != 5 || !string_only_numbers?(input) || input == nil
      puts "Invalid entry"
      get_zip
    end
    input
  end

  def string_only_numbers?(string)
    string.scan(/\D/).empty?
  end

  def menu
    # doc (minus zip in URL): http://www.gymsandfitnessclubs.com/gyms-by-location/results.php?postal_code=94582
    zip = get_zip
    @gyms = Gyms::Gym.local
    binding.pry

    puts "Enter gym number to get more details: "
    input = gets.strip

    while input > 0 && input < 11
      case input
      when "1"
        puts "More info on gym #1..."
      when "2"
        puts "More info on gym #2..."
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
