# frozen_string_literal: true

require './lib/refactored_gilded_rose'
require './lib/item'

describe GildedRose do
  describe '#update_quality' do
    describe 'on STANDARD Items' do
      let(:name) { '+5 Dexterity Vest' }
      
      it 'does not have negative Quality items' do
        items = [Item.new(name, 2, 0)]
        expect { GildedRose.new(items).update_quality }.not_to change { items[0].quality }
      end

      it 'decreases Quality by one BEFORE sell by date' do
        items = [Item.new(name, 10, 20)]
        expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by(-1)
      end

      it 'decreases Quality twice as fast AFTER sell by date' do
        items = [Item.new(name, 0, 20)]
        expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by(-2)
      end

      it 'changes both Quality and SellIn values' do
        items = [Item.new(name, 10, 20)]
        expect { GildedRose.new(items).update_quality }.to change(items[0], :quality && :sell_in).by(-1)
      end
    end

    describe 'on Aged Brie' do
      let(:name) { 'Aged Brie' }

      it 'increases quality the older it gets' do
        items = [Item.new(name, 10, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 21
      end

      it 'cannot increase its Quality more than 50' do
        items = [Item.new(name, 2, 50)]
        expect { GildedRose.new(items).update_quality }.not_to change { items[0].quality }
      end
    end

    describe 'on Backstage passes' do
      let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

      it 'does not have negative Quality items' do
        items = [Item.new(name, 0, 0)]
        expect { GildedRose.new(items).update_quality }.not_to change { items[0].quality }
      end

      it 'increases quality by 2 if BEFORE 10 days or less' do
        items = [Item.new(name, 10, 20)]
        expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by 2
      end

      it 'increases quality by 3 if BEFORE 5 days or less' do
        items = [Item.new(name, 5, 20)]
        expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by 3
      end

      it 'does not go above 50 if the sell_in 5 or less days' do
        items = [Item.new(name, 5, 49)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to be <= 50
      end

      it 'does not go above 50 if the sell_in 10 or less days' do
        items = [Item.new(name, 10, 49)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to be <= 50
      end

      it 'drops the Quality to zero AFTER sell by date' do
        items = [Item.new(name, 0, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end

    describe 'on Sulfuras' do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }

      it 'does not change its Quality over time' do
        items = [Item.new(name, 2, 80)]
        expect { GildedRose.new(items).update_quality }.not_to change { items[0].quality }
      end
    end

    describe 'on Conjured' do
      let(:name) { 'Conjured Mana Cake' }

      it 'degrades twice as fast as other items' do
        items = [Item.new(name, 10, 10)]
        expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by(-2)
      end
    end
  end
end
