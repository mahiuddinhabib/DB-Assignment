CREATE DATABASE DB_Assignment;

USE DB_Assignment;

CREATE TABLE product_category (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE product_inventory (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  quantity INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE discount (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  discount_percent DECIMAL(5,2) NOT NULL,
  active BOOLEAN NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE product (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  SKU VARCHAR(255) NOT NULL,
  category_id INT NOT NULL,
  inventory_id INT UNIQUE NOT NULL, -- UNIQUE to ensure one to one relationship
  price DECIMAL(10,2) NOT NULL,
  discount_id INT DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP DEFAULT NULL,
  FOREIGN KEY (category_id) REFERENCES product_category(id),
  FOREIGN KEY (inventory_id) REFERENCES product_inventory(id),
  FOREIGN KEY (discount_id) REFERENCES discount(id)
);

INSERT INTO product_category (name, description) VALUES
('Electronics', 'Category for electronic devices');

INSERT INTO product_inventory (quantity) VALUES
(50);

INSERT INTO discount (name, discount_percent, active) VALUES
('Holiday Sale', 10.00, true);

INSERT INTO product (name, SKU, category_id, inventory_id, price, discount_id) VALUES
('Smartphone', 'ABC123', 1, 1, 599.99, 1);

select * from product_category;
select * from product;
select * from product_inventory;
select * from discount;
