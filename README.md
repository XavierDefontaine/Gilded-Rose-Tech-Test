# Gilded Rose tech test

## Overview
My personal take on the famous Gilded Rose refactoring tech test.

## Description:
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

## The Task
Here, I had to add the new feature to the system so that they can begin selling a new category of items: 
* “Conjured” items degrade in Quality twice as fast as normal items.
- Restrictions: I could change the update_quality method/add any code I liked but not touch the Item class.

## My approach
- I used a TDD

