require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(File.read(index_url))
    # doc.css("div.roster-cards-container").css("h4").each do |name|
    students = Array.new(doc.css("h4").count)
    for i in (0...doc.css("h4").count)
      students[i] = {
        name: doc.css("h4")[i].text,
        location: doc.css("p")[i].text,
        profile_url: doc.css("div.student-card a")[i]["href"]
        }
    end

    students
<<<<<<< HEAD
=======
    binding.pry
>>>>>>> 384efea9b0d285d757e0b842319ada4dcfd544fb
    # both name and location doc.css("div.card-text-container").first.text
    # name only: doc.css("h4").first.text
    # location only: doc.css("p").first.text
    # link only: doc.css("div.student-card a").first["href"]
  end

  def self.scrape_profile_page(profile_url)
  #  profile_url = fixtures/student-site/students/ryan-johnson.html
    doc = Nokogiri::HTML(File.read(profile_url))
    info = {}

<<<<<<< HEAD

    available_info = {}
    doc.css("div.social-icon-container a").each do |object|
      link = object["href"]
      if link.include?("twitter")
        available_info[:twitter] = link
      elsif link.include?("linkedin")
        available_info[:linkedin] = link
      elsif link.include?("github")
        available_info[:github] = link
      else
        available_info[:blog] = link
      end
    end

    available_info[:profile_quote] = doc.css("div.profile-quote").text
    available_info[:bio] = doc.css("div.description-holder p").text

    available_info


=======
    def make_hash(twitter_value:, linkedin_value:, github_value:, blog_value:, profile_quote_value:, bio_value:)
      info[:twitter] = twitter_value
      info[:linkedin] = linkedin_value
      info[:github] = github_value
      info[:blog] = blog_value
      info[:profile_quote] = profile_quote_value
      info[:bio] = bio_value
      info
    end

    available_info = {
      :twitter_value => 1,
      :linkedin_value => 2,
      :github_value => 3,
      :blog_value => 4,
      :profile_quote_value => 5,
      :bio_value => 6
    }

    make_hash(available_info)
>>>>>>> 384efea9b0d285d757e0b842319ada4dcfd544fb
  end

end


#ruby lib/scraper.rb
