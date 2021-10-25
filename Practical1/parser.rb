# frozen_string_literal: true

require 'faraday'
require 'csv'

class CSVDownloader
  def self.download_from(url)
    response = Faraday.get url

    raise ArgumentError if response.status.to_s.match(/[4-5]\d{2}/)

    File.open('cities.csv', 'w') { |file| file.write(response.body) }
    # raise TypeError if File.open('cities.csv').type != CSV
  end
end

class CSVParser
  def self.parse(path)
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    ParseResponse.new(list)
  end
end

class ParseResponse
  attr_accessor :list

  def initialize(list)
    @list = list
  end

  def search
    list.select { |row| row['City'] =~ /[^^]\s\w+\s\w+$/ }
  end
end
