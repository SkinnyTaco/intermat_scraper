class IntermatScrape::Scraper
  attr_accessor :weight_class

  BASE_URL = 'https://www.intermatwrestle.com/rankings/college/'.freeze

  def self.get_doc_by_weight(weight_class)
    Nokogiri::HTML(open(BASE_URL + weight_class.weight))
  end

  def self.get_rows(weight_class)
    get_doc_by_weight(weight_class).css('table.table tbody tr')
  end

  def self.create_wrestlers(weight_class)
    get_rows(weight_class).collect do |row|
      IntermatScrape::Wrestler.new_by_row(row).tap do |w|
        weight_class.add_wrestler(w)
      end
    end
  end
end
