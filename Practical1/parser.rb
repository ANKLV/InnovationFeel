require 'faraday'
require 'csv'

class CSVparser
  def self.parse_from(url)
  	response = Faraday.get url
    obj = ParseResponse.new

  	csv = File.open('cities.csv', 'w') { |file| file.write(response.body) }

  	CSV.foreach('./cities.csv', headers: true) do |row|
	    obj.list << row.to_h
	  end
    obj
  end
end

class ParseResponse
  attr_accessor :list

  def initialize
    @list = []
  end

  def search
    self.list.select { |h| h["City"].match(/(\w+\s\w+\s\w+)/) }
  end
end
