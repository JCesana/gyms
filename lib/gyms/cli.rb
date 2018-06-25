require 'pry'
class Gyms::CLI

  attr_accessor :zip

  def call
    title
    zip = get_zip
    get_gyms(zip)
    menu
    goodbye
  end

  def title
    puts ""
    puts "Gym Locator"
    puts ""
  end

  def get_gyms(zip)
    @gyms = Gyms::Gym.get_local_gyms(zip)
  end

  def menu
    input = nil
    list_gyms
    while input != "exit"
      input = get_detail_input
      display_detail(input)
    end

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

  def get_detail_input
    puts "Type number for gym details or type exit:"
    input = gets.strip
    if input.to_i < 0 || input.to_i > 8
      puts "Invalid entry. Try again:"
      get_detail_input
    end
    input
  end

  def list_gyms
    @gyms.each.with_index(1) do |gym, i|
      puts "#{i}. #{gym.name}"
    end
  end

  def display_detail(input)
      puts ""
      puts @gyms[input.to_i - 1].name
      puts @gyms[input.to_i - 1].address1
      puts @gyms[input.to_i - 1].address2
      puts @gyms[input.to_i - 1].phone
      puts ""
  end

  def goodbye
    puts "Enjoy your workout!"
  end
end
