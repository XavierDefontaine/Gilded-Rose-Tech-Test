# frozen_string_literal: true

class GildedRose
  NON_STANDARD_ITEMS = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros'].freeze

  def initialize(items)
    @items = items
  end

  def decrease_quality(item)
    item.quality = item.quality - 1 if item.quality.positive?
  end

  def increase_quality(item)
    item.quality = item.quality + 1 if quality_is_less_than_50?(item)
  end

  def quality_is_less_than_50?(item)
    item.quality < 50
  end

  def sell_in_date_passed?(item)
    item.sell_in < 0
  end

  def is_a_standard?(item)
    !NON_STANDARD_ITEMS.include?(item)
  end

  def update_quality
    @items.each do |item|
      if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert' && item.name != 'Sulfuras, Hand of Ragnaros'
        decrease_quality(item)
      else
        increase_quality(item)
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          increase_quality(item) if item.sell_in < 11
          increase_quality(item) if item.sell_in < 6
        end
      end

      # Decreases Sell In date if item is not Sultura
      item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras, Hand of Ragnaros'

      # Checking if sell in date is negative
      if sell_in_date_passed?(item)

        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            decrease_quality(item) if item.name != 'Sulfuras, Hand of Ragnaros'
          else
            item.quality = item.quality - item.quality
          end
        end
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
