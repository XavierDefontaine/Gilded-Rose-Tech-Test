# frozen_string_literal: true

require './lib/gilded_rose'

#  Item(name, sell_in, quality)

describe GildedRose do
  describe '#update_quality' do
    it 'does not have negative Quality items' do
      items = [Item.new('+5 Dexterity Vest', 2, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    describe 'on STANDARD Items' do
      let(:name) { '+5 Dexterity Vest' }

      it 'does not have negative Quality items' do
        items = [Item.new(name, 2, 0)]
        GildedRose.new(items).update_quality
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
        items = [Item.new(name, 0, 0)]
        GildedRose.new(items).update_quality
        expect { GildedRose.new(items).update_quality }.to change(items[0], :quality && :sell_in).by(-1)
      end
      # it "cannot have a Quality more than 50"
      #   items = [Item.new("+5 Dexterity Vest", 0, 50)]
      #   GildedRose.new(items).update_quality()
      #   expect(items[0].quality).to eq 50
      # end
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
        GildedRose.new(items).update_quality
        expect { GildedRose.new(items).update_quality }.not_to change { items[0].quality }
      end
    end

    describe 'on Backstage passes' do
      let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

      it 'does not have negative Quality items' do
        items = [Item.new(name, 0, 0)]
        GildedRose.new(items).update_quality
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

      it 'drops the Quality to zero AFTER sell by date' do
        items = [Item.new(name, 0, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end

    describe 'on Sulfuras, Hand of Ragnaros' do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }

      it 'does not change its Quality over time' do
        items = [Item.new(name, 2, 80)]
        GildedRose.new(items).update_quality
        expect { GildedRose.new(items).update_quality }.not_to change { items[0].quality }
      end
    end
  end
end
