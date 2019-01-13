class IntermatScrape::Wrestler
  attr_accessor :rank, :weight_class, :school, :class_standing, :conference
  attr_reader :name

  def initialize(rank, name, school, class_standing, conference)
    @rank = rank
    @name = name
    @school = school
    @class_standing = class_standing
    @conference = conference
  end

  def self.new_by_row(row)
    new(
      row.children[1].text,
      row.css(':nth-child(2) a').text,
      row.css(':nth-child(3)').text,
      row.css(':nth-child(4)').text,
      row.css(':nth-child(5)').text
    )
  end

  def to_s
    puts ''
    puts "----------- #{name}  ##{rank} -----------".on_blue
    puts ''
    puts "School:".colorize(:light_cyan).ljust(20).concat(@school)
    puts "Class:".colorize(:light_cyan).ljust(20).concat(@class_standing)
    puts "Conference:".colorize(:light_cyan).ljust(20).concat(@conference)
  end
end
