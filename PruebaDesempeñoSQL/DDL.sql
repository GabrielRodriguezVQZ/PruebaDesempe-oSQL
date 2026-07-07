CREATE TABLE eco_city (
    id_city SERIAL PRIMARY KEY,
    city_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE eco_client (
    id_client SERIAL PRIMARY KEY,
    client_name VARCHAR(150) NOT NULL,
    id_city INT NOT NULL,
    CONSTRAINT fk_client_city
    FOREIGN KEY (id_city) REFERENCES eco_city(id_city)
    ON DELETE RESTRICT
);


CREATE TABLE eco_category (
    id_category SERIAL PRIMARY KEY,
    category_name VARCHAR(80) NOT NULL UNIQUE
);



CREATE TABLE eco_product (
    id_product SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL UNIQUE,
    id_category INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price > 0),
    current_stock INT NOT NULL DEFAULT 0 CHECK (current_stock >= 0),
    CONSTRAINT fk_product_category
    FOREIGN KEY (id_category) REFERENCES eco_category(id_category)
    ON DELETE RESTRICT
);



CREATE TABLE eco_distribution_center (
    id_dc SERIAL PRIMARY KEY,
    dc_name VARCHAR(100) NOT NULL UNIQUE,
    id_city INT NOT NULL,
    CONSTRAINT fk_dc_city
    FOREIGN KEY (id_city) REFERENCES eco_city(id_city)
    ON DELETE RESTRICT
);



CREATE TABLE eco_order (
    id_order SERIAL PRIMARY KEY,
    order_code VARCHAR(20) NOT NULL UNIQUE,
    order_date DATE NOT NULL,
    id_client INT NOT NULL,
    id_dc INT NOT NULL,
    CONSTRAINT fk_order_client
    FOREIGN KEY (id_client) REFERENCES eco_client(id_client)
    ON DELETE RESTRICT,
    CONSTRAINT fk_order_dc
    FOREIGN KEY (id_dc) REFERENCES eco_distribution_center(id_dc)
    ON DELETE RESTRICT
);



CREATE TABLE eco_order_detail (
    id_detail SERIAL PRIMARY KEY,
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price > 0),
    CONSTRAINT fk_detail_order
    FOREIGN KEY (id_order) REFERENCES eco_order(id_order)
    ON DELETE RESTRICT,
    CONSTRAINT fk_detail_product
    FOREIGN KEY (id_product) REFERENCES eco_product(id_product)
    ON DELETE RESTRICT
);