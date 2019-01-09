class IntermatScrape::Cli
  def load_data
    IntermatScrape::WeightClass.create_weight_classes
    IntermatScrape::WeightClass.all.each do |weight_class|
      IntermatScrape::Scraper.create_wrestlers(weight_class)
    end
  end

  def flow
    welcome
    load_data
    start
  end

  def welcome
    puts '----------------------------------------------------------------'
    puts ''
    puts 'Welcome to IntermatScrape, a way to delve into the top 20 ranked'
    puts '                    NCAA wrestlers.'
    puts ''
    puts '----------------------------------------------------------------'
  end

  def start
    puts ''
    puts 'What weight class are you interested in?'
    IntermatScrape::WeightClass.print_weights

    input = gets.strip
    until IntermatScrape::WeightClass::WEIGHT_CLASSES.include?(input)
      puts "I don't recognize that weight class. Please try again."
      input = gets.strip
    end
    weight_class = IntermatScrape::WeightClass.find_by_weight(input)

    puts ''
    puts "Type one of the following commands for the #{weight_class.weight} pound weight class:"
    puts 'rankings(r): show top 20 wrestlers'
    puts 'back(b): return to weight classes'
    command = gets.strip.downcase
    until %w[rankings r back b].include?(command)
      puts 'Invalid command. Please type a valid command.'
      command = gets.strip.downcase
    end

    case command
    when 'rankings', 'r'
      weight_class.print_wrestlers
    when 'back', 'b'
      start
    end

    puts ''
    puts 'Type one of the following commands:'
    puts 'a number 1-20 to view the corresponding wrestler'
    puts 'back(b): return to weight classes'
    command = gets.strip.downcase
    until %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 back b main m].include?(command)
      puts 'Invalid command. Please enter a valid command.'
      command = gets.strip.downcase
    end

    case command
    when '1'..'20'
      weight_class.get_wrestler_by_rank(command).to_s
    when 'back', 'b'
      start
    end

    puts 'Would you like to do now?'
    puts 'view(v): view another wrestler from this weight class'
    puts 'back(b): return to weight classes'
    command = gets.strip.downcase
    until %w[view v back b].include?(command)
      puts 'Invalid command. Please type a valid command.'
      command = gets.strip.downcase
    end

  end

  def quit_scraper
    puts "Thank you for using IntermatScrape!"
    exit
  end
end
