# Design Document

Franchise db by Ahsen Niaz

## Scope


* The purpose of my database is to keep record of all the shops in a franchise and the items each shops has and other attributes of those items in order to keep a record and anlyze the performance of each shop of the franchise, each vendor and each item. The database keeps track of all the locations of the shops, what items are in the shop, what are the type of items, what is quantity that each shop has of each item. It also keeps track of whcih item was bought from whcih vendor and when was it bought and when was it sold. It also keeps track of the sold items and what quantity was sold and when and for how much in order to know the profit and loss and anlayze the reasons. Human factors such as the shops manager , their employess are not inculuded in the scope of the database.

## Functional Requirements

* A user should be able to query any records of shops and their items and their financials by using this database. They should also be able to analyze the profit and loss statement based on type of items, the items themselves, the location of the shop and the dates where some items or type sell more or less. However, other factors that are human , environmental etc cannot be analyzed by this database.

## Representation

### Entities


The database represents shops of franchise, the shops have the attribute of a location to know where is that specific shop located. the shops have items as an entity the items have an id , a name , a type, quantity , price at which it was bought from the vendor and price at which it was sold. Vendors are also an entity. A vendor has an id and a name and can be connected to the items that they sold to the shop.
All the dates are numeric type, names are text and id are integer whereas the prices are REAL type in order to reprent decimal numbers
The shops names are text and their locations are also text whereas the shops id and the items id are integers and are unique in order to represent a unique relationship between each item, each shop and each vendor.
The ids of the shops, the items and the vendors have a constraint of PRIMARY KEY and NOT NULL so that the relationships can be established and each item, shop and vendor can be represented by a unique id. The item name, shop name and vendor name also have the constraint of NOT NULL because there always have to be some items and shops and vendores unless the franchise shuts down.


### Relationships

The shops can have multiple items and every item belongs to a shop but atleast has to have one item unless the shop closes down completely. a vendor can sell many items and a type of item can have many vendors or a vendor can sell different type of items but every item will have atleast one vendor. Many number and type of items can be bought from many different shops. Every item has atleast one prices but different type of items will have many different prices. Many items will be sold but no item can be sold and the sold items can be from many different vendors.

## Optimizations


* Every table has primary keys which will serve as indexes in order to have faster querying

## Limitations

* The databse will not be able to analyze other factors other than factors that can be quantified, things like human and environmental or any other exteranl factors. However, it can analyze the what and where is being sold or not sold quantitatively very well.
