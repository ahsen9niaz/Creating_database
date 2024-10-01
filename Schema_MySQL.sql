CREATE TABLE shops (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL
);

-- Contains all the items in the shop at that moment
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    shop_id INT,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    quantity INT,
    FOREIGN KEY (shop_id) REFERENCES shops(id)
);

-- Contains the information of when the item was bought
CREATE TABLE bought (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    bought_date DATE,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

-- Contains the information of the items bought from which vendor
CREATE TABLE vendors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

-- Contains information regarding what item was bought for what price and what price will it be sold for
CREATE TABLE prices (
    item_id INT,
    buy_price DECIMAL(10,2),
    sell_price DECIMAL(10,2),
    FOREIGN KEY (item_id) REFERENCES items(id)
);

-- Contains the information of which item was sold, when, and for what price
CREATE TABLE sold (
    item_id INT,
    item_name VARCHAR(255),
    quantity INT,
    sold_price DECIMAL(10,2),
    vendor_id INT,
    sold_date DATE DEFAULT CURDATE(),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (vendor_id) REFERENCES vendors(id)
);

-- Trigger that activates whenever an item is sold and removed from the items table
DELIMITER //
CREATE TRIGGER update_sold
BEFORE DELETE ON items
FOR EACH ROW
BEGIN
    INSERT INTO sold (item_id, item_name, sold_price, vendor_id, quantity)
    SELECT OLD.id, OLD.name, prices.sell_price, vendors.id, OLD.quantity
    FROM prices, vendors
    WHERE OLD.id = prices.item_id AND OLD.id = vendors.item_id;
END//
DELIMITER ;
