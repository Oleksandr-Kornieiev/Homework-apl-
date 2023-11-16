require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.hospitalsafetygrade.org/all-hospitals'
# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open(url))
hospital_id = 1
# Open CSV file in write mode
CSV.open('hospitals.csv', 'w') do |row|
  # Write header to CSV file
  row << ['ID', 'Hospital Name', 'URL']
  # Search for nodes by css in "div.responsive div#MainContainerInner section.content div.columnWrapper div.column1"
  doc.css('div#BlinkDBContent_849210 ul li a').each do |hyperlink_tag|
    hospital_name = hyperlink_tag.text.strip
    hospital_info = hyperlink_tag['href']
    # Add the hospital name, link and identifier to the CSV file
    row << [hospital_id, hospital_name, hospital_info]
    hospital_id += 1
  end
end