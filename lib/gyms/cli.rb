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
    @gyms = Gyms::Gym.get_local_gyms(get_zip)
    list
    puts "Enter gym number to get more details: "
    input = gets.strip

    if input.to_i > 0 && input.to_i < 9
      puts ""
      puts @gyms[input.to_i - 1].name
      puts @gyms[input.to_i - 1].address1
      puts @gyms[input.to_i - 1].address2
      puts @gyms[input.to_i - 1].phone
    end

    if input == "list"
      list
    else
      puts "Invalid entry. Try again."
      menu
    end

  end

  def list
    @gyms.each.with_index(1) do |gym, i|
      puts "#{i}. #{gym.name}"
    end
  end

  def goodbye
    "Thank you for using Gyms!"
  end
end
