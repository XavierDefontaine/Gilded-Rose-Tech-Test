# Gilded rose tech test

## Description:


We buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us:

```
- The Quality of an item is:
* [x] never negative 
* [ ] never more than 50
- BOTH Quality and SellIn values are updated


- "Standard Items": Quality degrades twice as fast after sellIn date.
- “Aged Brie”: increases in Quality the older it gets.
- “Backstage passes”: increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert.
- “Sulfuras”: never has to be sold or decreases in Quality.
Note: its Quality is 80 and it never alters.
```

```
* SellIn: value which denotes the number of days we have to sell the item. 
* Quality: value which denotes how valuable the item is. At the end of each day the system lowers both values for every item.
```

Your task is to add the new feature to our system so that we can begin selling a new category of items.

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

## The brief:

Choose [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata) (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

HINT: Test first FTW!


![Tracking pixel](https://githubanalytics.herokuapp.com/course/individual_challenges/gilded_rose.md)
