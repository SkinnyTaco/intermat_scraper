class IntermatScrape::Scraper

  attr_accessor :weight

  BASE_URL = "https://www.intermatwrestle.com/rankings/college/"

  def initialize(weight_class)
    @weight_class = weight_class
  end

  def self.get_doc_by_weight(weight_class)
    new(weight_class).Nokogiri::HTML(open(BASE_URL + @weight_class.weight.to_s))
  end

  def get_rows(weight_class)
    self.class.get_doc_by_weight(weight_class).css("table.table tbody tr")
  end

  def create_wrestlers(weight_class)
    get_rows(weight_class).collect do |row|
      IntermatScrape::Wrestler.new_by_row(row).tap do |w|
        w.weight_class = weight_class
      end
    end
  end
end
