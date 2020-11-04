require './lib/gilded_rose'
require './lib/texttest_fixture.rb'

# class Item
#   def initialize(name, sell_in, quality)

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context "for standard Items"
      context "BEFORE the sell by date"
        it "degrades Quality by one" do
          items = [Item.new("+5 Dexterity Vest", 10, 20)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 19
        end
      context "AFTER the sell by date"
        it "degrades Quality twice as fast " do
          items = [Item.new("+5 Dexterity Vest", 0, 20)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 18
        end
  end

end
