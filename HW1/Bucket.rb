class Bucket

  PRICES = {bread:20, cola:10, pasta:30, beef:100, tomato:40}

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
    self.items.each.map{|el| el = PRICES[el]}.sum
  end

  def +(bucket)
    self.items.concat bucket.items
    bucket.items.clear
    return self
  end
end