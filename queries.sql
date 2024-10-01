-- in order to find out what all items exist in the shop at the moment
SELECT * FROM items;

-- in order to find out what all items of a certain type exist in the shop
SELECT * FROM items WHERE type = 'buiscuits';

-- finds out which items are in which shops
SELECT items.item , shops.location FROM items JOIN shops ON shops.id = items.shop_id;

-- to find out items of a cretain type in a particualar shop of that franchise
SELECT items.item FROM items JOIN shops ON shops.id = items.shop_id WHERE type = 'buiscuits' AND shops.location = 'Westridge';

--to find out which item or how many items were bought when and when were they sold to know how fast an item sell, knowing its buy and sold price to find out the profit on each item
SELECT items.item, bought.bought_date, prices.buy_price, sold.sold_price,sold.vendor_id FROM items
JOIN shops ON shops.id = items.id
JOIN bought ON bought.item_id = items.id
JOIN prices ON  prices.item_id = items.id
JOIN sold ON sold.item_id = items.id
WHERE shops.location = 'Westridge';


-- to find out which item and how much is selling in which location to analyze best and worst selling items
SELECT shops.location ,sold.item_name , sold.quantity FROM shops
JOIN items ON items.shops_id = shops.id
JOIN sold ON sold.item_id = items.id
ORDER BY sold.quantity DESC;
