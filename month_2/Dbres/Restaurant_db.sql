DROP TABLE IF EXISTS restaurants;
CREATE TABLE restaurants (
  id integer PRIMARY KEY AUTOINCREMENT,
  postcode string
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  id integer PRIMARY KEY AUTOINCREMENT,
  first_name string,
  last_name string,
  contact_number string
);

DROP TABLE IF EXISTS tables;
CREATE TABLE tables (
  id integer PRIMARY KEY AUTOINCREMENT,
  restaurant_id integer,
  capacity integer,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings (
  id integer PRIMARY KEY AUTOINCREMENT,
  customer_id integer,
  table_id integer,
  starting_time datetime,
  ending_time datetime,
  FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
  FOREIGN KEY (table_id) REFERENCES tables (id) ON DELETE CASCADE
);