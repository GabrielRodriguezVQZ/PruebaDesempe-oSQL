INSERT INTO eco_city (city_name)
VALUES
('Barranquilla'),
('Bogot�'),
('Bucaramanga'),
('Cali'),
('Cartagena'),
('C�cuta'),
('Manizales'),
('Medell�n'),
('Pereira');


INSERT INTO eco_client (client_name, id_city) VALUES
('SuperMax', 2),
('FreshMart', 8),
('MiniShop', 4),
('SuperMax', 1),
('EcoStore', 5),
('MarketOne', 3),
('RetailCo', 9),
('FoodPlus', 7),
('GreenBuy', 2),
('QuickFood', 6);

INSERT INTO eco_category (category_name)
VALUES
('Fruits'),
('Dairy'),
('Meats'),
('Grains'),
('Oils'),
('Vegetables');

INSERT INTO eco_distribution_center (dc_name, id_city) VALUES
('Center North', 2),
('Center West', 8),
('South Hub', 4),
('Coast DC', 1),
('East Hub', 3),
('Coffee DC', 9);

INSERT INTO eco_product (product_name, id_category, unit_price, current_stock) VALUES
('Apple Gala', 2, 2.50, 98),
('Banana', 2, 1.20, 172),
('Whole Milk', 1, 3.80, 56),
('Chicken Breast', 4, 6.50, 65),
('Rice 1kg', 3, 2.00, 191),
('Olive Oil', 5, 8.90, 38),
('Eggs x12', 1, 4.20, 86),
('Tomato', 6, 1.80, 112),
('Lettuce', 6, 1.10, 46),
('Pasta', 3, 2.30, 134);

INSERT INTO eco_order (order_code, order_date, id_client, id_dc) VALUES
('O1001', '2026-05-01', 1, 1),
('O1002', '2026-05-02', 1, 1),
('O1003', '2026-05-02', 2, 2),
('O1004', '2026-05-03', 2, 2),
('O1005', '2026-05-04', 3, 3),
('O1006', '2026-05-05', 3, 3),
('O1007', '2026-05-06', 4, 4),
('O1008', '2026-05-07', 4, 4),
('O1009', '2026-05-08', 5, 4),
('O1010', '2026-05-09', 5, 4),
('O1011', '2026-05-10', 6, 5),
('O1012', '2026-05-11', 6, 5),
('O1013', '2026-05-12', 7, 6),
('O1014', '2026-05-13', 7, 6),
('O1015', '2026-05-14', 8, 6),
('O1016', '2026-05-15', 8, 6),
('O1017', '2026-05-16', 9, 1),
('O1018', '2026-05-17', 9, 1),
('O1019', '2026-05-18',10, 5),
('O1020', '2026-05-19',10, 5);


INSERT INTO eco_order_detail (id_order, id_product, quantity, unit_price) VALUES
(1, 1, 10, 2.50), (2, 1, 5, 2.50),
(3, 2, 20, 1.20), (4, 2, 15, 1.20),
(5, 3, 12, 3.80), (6, 3, 8, 3.80),
(7, 4, 25, 6.50), (8, 4, 10, 6.50),
(9, 5, 30, 2.00), (10, 5, 18, 2.00),
(11, 6, 6, 8.90), (12, 6, 4, 8.90),
(13, 7, 14, 4.20), (14, 7, 9, 4.20),
(15, 8, 22, 1.80), (16, 8, 16, 1.80),
(17, 9, 11, 1.10), (18, 9, 7, 1.10),
(19,10, 19, 2.30), (20,10, 13, 2.30);