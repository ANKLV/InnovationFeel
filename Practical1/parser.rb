# frozen_string_literal: true

require 'faraday'
require 'csv'

class CSVparser
  def self.parse_from(url)
    response = Faraday.get url
    parse_obj = ParseResponse.new

    File.open('cities.csv', 'w') { |file| file.write(response.body) }

    CSV.foreach('./cities.csv', headers: true) do |row|
      parse_obj.list << row.to_h
    end
    parse_obj
  end
end

class ParseResponse
  attr_accessor :list

  def initialize
    @list = []
  end

  def search
    list.select { |h| h['City'].match(/(\w+\s\w+\s\w+)/) }
  end
end
