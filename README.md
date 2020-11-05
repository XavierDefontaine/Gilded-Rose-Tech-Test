# Gilded Rose Tech Test

## Index
* [Overview](#Overview)
* [Description](#Description)
* [The Task](#Task)
* [Installation](#Installation)
* [Technologies used](#Tech)
* [My Approach](#Approach)

## <a name="Overview">Overview:</a>
My personal take on the famous Gilded Rose refactoring tech test during week 10 at [Makers Academy](http://www.makersacademy.com). 

## <a name="Description">Description:</a>
```
        `'::.
    _________H ,%%&%,
   /\     _   \%&&%%&%
  /  \___/^\___\%&%%&&
  |  | []   [] |%\Y&%'
  |  |   .-.   | ||  
~~@._|@@_|||_@@|~||~~~~~~~~~~~~~
     `""") )"""`
```

Welcome to the Gilded Rose Inn. 

They buy and sell only the finest goods. Unfortunately, their goods are constantly degrading in quality as they approach their sell by date. They have a system in place that updates their inventory for them but the guy who made it left spaghetti code behind him - those are the the key features:

```
- The Quality of an item is:
* [x] never negative 
* [x] never more than 50
- [x] BOTH Quality and SellIn values are updated
- [x] "Standard Items": Quality degrades twice as fast after sellIn date.
- [x] “Aged Brie”: increases in Quality the older it gets.
- [x] “Backstage passes”: increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert.
- [x] “Sulfuras”: never has to be sold or decreases in Quality.
Note: its Quality is 80 and it never alters.
```

## <a name="Task">The Task:</a>
Here, I had to add the new feature to the system so that they can begin selling a new category of items: 
* “Conjured” items degrade in Quality twice as fast as normal items.

Restrictions: I could change the update_quality method/add any code but not touch the Item class.
  
## <a name="Installation">Installation:</a>
* Clone the repo
* 'cd gilded_rose_ruby'
* Run bundle install
* Run 'rspec' to test
  
## <a name="Tech">Tech Used:</a>
* Linter: [Rubocop](https://github.com/rubocop-hq/rubocop)
* Test framework: [RSpec](https://github.com/rspec/rspec)
* ±100% Test coverage with: [Simplecov]([https://github.com/simplecov-ruby/simplecov)
* Dependencies management: [Bundler](https://github.com/rubygems/bundler)
  
## <a name="Approach">My Approach:</a>

- I used TDD / BDD:

The legacy code was [particularly bad](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/ruby/gilded_rose.rb) so I decided to start writing tests following the criterias provided and made sure 100 % were covered along with any edge cases.

- I then tidied up the codebase by:

Encapsulating every repeated patterns into its own method which helped identify redundancies in the algorithmn to delete and modify the newly created methods to effectively narrow down the code to a simple case statement that can easily be adapted to add any new items.

- I also made sure my methods were properly named (i.e. with question marks for booleans) and all helper methods moved to private to help readabiliy!


