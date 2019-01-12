class IntermatScrape::WeightClass
  attr_accessor :wrestlers, :weight

  WEIGHT_CLASSES = %w[125 133 141 149 157 165 174 184 197 Hwt].freeze

  @@all = []

  def initialize(weight)
    @weight = weight
    @wrestlers = []
    @@all << self
  end

  def self.create_weight_classes
    WEIGHT_CLASSES.each do |weight|
      new(weight)
    end
    @@all
  end

  def self.print_weights
    puts WEIGHT_CLASSES
  end

  def self.find_by_weight(weight)
    @@all.detect { |w| w.weight == weight }
  end

  def add_wrestler(wrestler)
    @wrestlers << wrestler
    wrestler.weight_class = self
  end

  # TODO: move to Wrestler class?
  def print_wrestlers
    @wrestlers.each.with_index { |w, _i| puts "#{w.rank}\t\t#{w.name}" }
  end

  # TODO: move to Wrestler class?
  def get_wrestler_by_rank(rank)
    @wrestlers.detect { |w| w.rank == rank }
  end

  def self.all
    @@all
  end
end
