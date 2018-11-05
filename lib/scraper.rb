require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_html = open(index_url)
    index_doc = Nokogiri::HTML(index_html)
    student_cards = index_doc.css(".student-card")
    students = []
    student_cards.collect do |student_card_xml|
      students << {
        :name => student_card_xml.css("h4.student-name").text,
        :location => student_card_xml.css("p.student-location").text,
        :profile_url => "./fixtures/student-site/" + student_card_xml.css("a").attribute("href").value
        }
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
