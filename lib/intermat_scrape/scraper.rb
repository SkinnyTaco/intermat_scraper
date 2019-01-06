class IntermatScrape::Scraper

  BASE_URL = "https://www.intermatwrestle.com/rankings/college"

  def get_doc
    Nokogiri::HTML(open(BASE_URL))
  end

  def get_wrestlers
    get_doc.css("table.table tbody tr")
  end
end
