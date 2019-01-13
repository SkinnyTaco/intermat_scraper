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
    puts '-----------------------------------------------------------------'
    puts ''
    puts 'Welcome to IntermatScrape, a way to delve into the top 20 ranked'
    puts '                        NCAA wrestlers.'
    puts ''
    puts '                          LOADING...'
    puts ''
    puts '-----------------------------------------------------------------'
  end

  def start
    if weight_class = choose_weight
      choose_rank(weight_class)
      if restart?
        start
      else
        choose_rank(weight_class)
      end
    end
  end

  def quit_scraper
    puts ''
    puts 'Thank you for using IntermatScrape!'
    exit
  end

  def choose_weight
    weight_class = nil
    puts ''
    puts 'What weight class are you interested in?'
    puts ''
    IntermatScrape::WeightClass.print_weights

    input = gets.strip
    until IntermatScrape::WeightClass::WEIGHT_CLASSES.include?(input)
      puts "I don't recognize that weight class. Please try again."
      input = gets.strip
    end

    puts ''
    puts 'Type one of the following commands:'
    puts 'rankings(r):'.colorize(:light_cyan).concat(' show top 20 wrestlers')
    puts 'back(b):'.colorize(:light_cyan).concat(' return to weight classes')
    puts 'exit:'.colorize(:light_cyan).concat(' exit program')
    puts ''
    command = gets.strip.downcase
    until %w[rankings r back b exit].include?(command)
      puts 'Invalid command. Please type a valid command.'
      command = gets.strip.downcase
    end

    case command
    when 'rankings', 'r'
      weight_class = IntermatScrape::WeightClass.find_by_weight(input)
    when 'back', 'b'
      start
    when 'exit'
      quit_scraper
    end
    weight_class
  end

  def choose_rank(weight_class)
    weight_class.print_wrestlers
    puts ''
    puts 'Type one of the following commands:'
    puts 'a number 1-20'.colorize(:light_cyan).concat(' to view the corresponding wrestler')
    puts 'back(b):'.colorize(:light_cyan).concat(' return to weight classes')
    puts 'exit:'.colorize(:light_cyan).concat(' exit program')
    puts ''
    command = gets.strip.downcase
    until %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 back b exit].include?(command)
      puts 'Invalid command. Please enter a valid command.'
      command = gets.strip.downcase
    end

    case command
    when '1'..'20'
      weight_class.get_wrestler_by_rank(command).to_s
    when 'back', 'b'
      start
    when 'exit'
      quit_scraper
    end
  end

  def restart?
    puts ''
    puts 'Would you like to do now?'
    puts 'view(v):'.colorize(:light_cyan).concat(' view another wrestler from this weight class')
    puts 'back(b):'.colorize(:light_cyan).concat(' return to weight classes')
    puts 'exit:'.colorize(:light_cyan).concat(' exit program')
    puts ''
    command = gets.strip.downcase
    until %w[view v back b exit].include?(command)
      puts 'Invalid command. Please type a valid command.'
      command = gets.strip.downcase
    end
    case command
    when 'view', 'v'
      false
    when 'back', 'b'
      true
    when 'exit'
      quit_scraper
    end
  end
end
