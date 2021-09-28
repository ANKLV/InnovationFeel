# frozen_string_literal: true

class Bucket
  PRICES = { bread: 20, cola: 10, pasta: 30, beef: 100, tomato: 40 }.freeze

  attr_accessor :items

  def initialize
    @items = []
    puts @items
  end

  def add_item(item)
    if PRICES.include?(item)
      @items << item
    else " Error! You can add only: #{PRICES.keys}"
    end
  end

  def total_sum
    items.map { |el| el = PRICES[el] }.sum
  end

  def +(other)
    items.concat other.items
    other.items.clear
    self
  end
end
