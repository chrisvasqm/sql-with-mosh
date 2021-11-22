USE vidly;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles
(
	role_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE users
(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY fk_users_roles (role_id) 
		REFERENCES roles (role_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS coupons;

CREATE TABLE customers 
(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL
);

CREATE TABLE movies
(
	movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    `date` DATE NOT NULL,
    director VARCHAR(100) NOT NULL,
    barcode VARCHAR(10) NOT NULL,
    dailyRentalRate FLOAT NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    isLost BOOL NOT NULL DEFAULT FALSE
);

CREATE TABLE coupons
(
	coupon_id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    discount INT NOT NULL
);

CREATE TABLE rentals
(
	rental_id INT PRIMARY KEY AUTO_INCREMENT,
    rent_date DATE NOT NULL,
    return_date DATE NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY fk_rentals_customers (customer_id)
		REFERENCES customers (customer_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
	movie_id INT NOT NULL,
    FOREIGN KEY fk_rentals_movies (movie_id)
		REFERENCES movies (movie_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
	coupon_id INT,
    FOREIGN KEY fk_rentals_coupons (coupon_id)
		REFERENCES coupons (coupon_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);