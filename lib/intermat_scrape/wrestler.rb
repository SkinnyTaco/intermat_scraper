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
    puts "----------- #{name}  ##{rank} -----------"
    puts ''
    puts "School:           #{school}"
    puts "Class:          #{class_standing}"
    puts "Conference:      #{conference}"
  end
end
