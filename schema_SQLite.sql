CREATE TABLE "shops"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "location" TEXT NOT NULL
);
-- Contains all the items in the shop at that moment
CREATE TABLE "items" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "shop_id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "quantity" INTEGER,
    FOREIGN KEY "shop_id" REFERENCES "shops"("id")
);

-- contains the information of when the item was bought
CREATE TABLE "bought"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "item_id" INTEGER,
    "bought_date" NUMERIC,
    FOREIGN KEY ("item_id") REFERENCES "items"("id")
);

-- contains the information of the what items were bought from which vendor
CREATE TABLE "vendors" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "item_id" INTEGER,
    FOREIGN KEY ("item_id") REFERENCES "items"("id")
);

-- contains the information regarding what item was bought for what price and what price will it be sold for
CREATE TABLE "prices" (
    "item_id" INTEGER,
    "buy_price" REAL,
    "sell_price" REAL,
    FOREIGN KEY ("item_id") REFERENCES "items"("id")
);

-- contains the information of which item was sold, when and for what price

CREATE TABLE "sold" (
    "item_id" INTEGER,
    "item_name" text,
    "quantity" INTEGER,
    "sold_price" REAL,
    "vendor_id" INTEGER
    "sold_date" DATE DEFAULT (date('now')),
    FOREIGN KEY ("item_id") REFERENCES "items"("id")
    FOREIGN KEY ("vendor_id") REFERENCES "vendor"("id")
);

-- this trigger gets activated whenever some item is sold and removed from the items table

CREATE TRIGGER update_sold
BEFORE DELETE
ON "items" FOR EACH ROW
BEGIN
    INSERT INTO "sold"("item_id", "item_name", "sold_price", "vendor_id","quantity")
    SELECT "OLD.id", "OLD.name", "prices.sell_price", "vendors.id","OLD.quantity"
    FROM "prices", "vendors"
    WHERE "OLD.id" = "prices.item_id" AND "OLD.id" = "vendors.item_id";
END;
