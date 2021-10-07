# frozen_string_literal: true

require "open-uri"

url = "https://en.wikipedia.org/wiki/Medical_procedure"
procedures = Nokogiri::HTML.parse(Kernel.open(url))
  .css("#mw-content-text")
  .css(".mw-parser-output")
  .xpath("//ul").xpath("//li")
  .xpath('//a[starts-with(@href, "/wiki")]')
  .map(&:text)

Procedure.destroy_all if procedures.present?

procedures.each do |name|
  Procedure.create(name: name)
end
