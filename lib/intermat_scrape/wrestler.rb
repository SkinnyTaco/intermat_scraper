class IntermatScrape::Wrestler
  attr_accessor :rank, :weight_class, :school, :class_standing, :conference, :name

  def initialize(wrestler_hash)
    wrestler_hash.each { |k, v| self.send("#{k}=", v) }
  end

  #TODO move to Cli.class
  def to_s
    puts ''
    puts "----------- #{name}  ##{rank} -----------".on_blue
    puts ''
    puts "School:".colorize(:light_cyan).ljust(20).concat(@school)
    puts "Class:".colorize(:light_cyan).ljust(20).concat(@class_standing)
    puts "Conference:".colorize(:light_cyan).ljust(20).concat(@conference)
  end
end
