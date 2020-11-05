# frozen_string_literal: true
require_relative 'item'

class GildedRose
  ## Please add any new items that are not standard here:
  NON_STANDARD_ITEMS = ['Aged Brie', 
    'Backstage passes to a TAFKAL80ETC concert', 
    'Sulfuras, Hand of Ragnaros', 
    'Conjured Mana Cake'].freeze

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      decrease_sell_in_date(item)
      case item.name
      when is_a_standard?(item)
        sell_in_date_passed?(item) ? decrease_quality_twice(item) : decrease_quality(item)
      when 'Aged Brie'
        increase_quality(item)
      when 'Conjured Mana Cake'
        decrease_quality_twice(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        if item.sell_in > 10
          increase_quality(item)
        elsif item.sell_in.between?(5, 10)
          increase_quality_twice(item)
        elsif item.sell_in.between?(0, 5)
          increase_quality_thrice(item)
        elsif sell_in_date_passed?(item)
          item.quality = 0
        end
      end
    end
  end

  private

  def increase_quality(item)
    item.quality += 1 if quality_is_less_than_50?(item)
  end

  def increase_quality_twice(item)
    2.times { item.quality += 1 if quality_is_less_than_50?(item) }
  end

  def increase_quality_thrice(item)
    3.times { item.quality += 1 if item.quality < 50 }
  end

  def decrease_quality(item)
    item.quality -= 1 if item.quality.positive?
  end

  def decrease_quality_twice(item)
    2.times { item.quality -= 1 if item.quality.positive? }
  end

  def quality_is_less_than_50?(item)
    item.quality < 50
  end

  def sell_in_date_passed?(item)
    item.sell_in.negative?
  end

  def decrease_sell_in_date(item)
    item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def is_a_standard?(item)
    return item.name unless NON_STANDARD_ITEMS.include?(item.name)
  end
end