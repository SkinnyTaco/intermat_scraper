class IntermatScrape::Scraper
  attr_accessor :weight_class

  BASE_URL = 'https://www.intermatwrestle.com/rankings/college/'.freeze

  def self.get_doc_by_weight(weight_class)
    Nokogiri::HTML(open(BASE_URL + weight_class.weight))
  end

  def self.get_rows(weight_class)
    get_doc_by_weight(weight_class).css('table.table tbody tr')
  end

  def self.create_hash_from_row(row)
    {
      rank: row.children[1].text,
      name: row.css(':nth-child(2) a').text,
      school: row.css(':nth-child(3)').text,
      class_standing: row.css(':nth-child(4)').text,
      conference: row.css(':nth-child(5)').text
    }
  end

  def self.create_wrestlers(weight_class)
    get_rows(weight_class).collect do |row|
      wrestler_hash = create_hash_from_row(row)
      IntermatScrape::Wrestler.new(wrestler_hash).tap do |w|
        weight_class.add_wrestler(w)
      end
    end
  end
end
