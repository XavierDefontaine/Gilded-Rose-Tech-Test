# frozen_string_literal: true

class GildedRose
  NON_STANDARD_ITEMS = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros'].freeze

  def initialize(items)
    @items = items
  end

  def decrease_quality(item)
    item.quality -= 1 if item.quality.positive?
  end

  def decrease_quality_twice(item)
    item.quality -= 2 if item.quality.positive?
    p "Dun it!"
  end

  def increase_quality(item)
    item.quality += 1 if quality_is_less_than_50?(item)
  end

  def quality_is_less_than_50?(item)
    item.quality < 50
  end

  def sell_in_date_passed?(item)
    item.sell_in < 0
  end

  def decrease_sell_in_date(item)
    item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def is_a_standard?(item)
    return item.name if !NON_STANDARD_ITEMS.include?(item.name)
  end

  def update_quality
    @items.each do |item|
      decrease_sell_in_date(item)
      case item.name
      when is_a_standard?(item)
        sell_in_date_passed?(item) ? decrease_quality_twice(item) : decrease_quality(item)
      when "Aged Brie"
        increase_quality(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
          increase_quality(item)
          increase_quality(item) if item.sell_in < 11
          increase_quality(item) if item.sell_in < 6
          item.quality = 0 if sell_in_date_passed?(item)
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
