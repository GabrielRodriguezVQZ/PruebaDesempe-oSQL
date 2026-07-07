--INSERT--

INSERT INTO eco_client (client_name, id_city)
VALUES ('NaturalStore',
(SELECT id_city FROM eco_city WHERE city_name = 'Bogot�'));

INSERT INTO eco_order (order_code, order_date, id_client, id_dc)
VALUES ('O1021', '2026-05-20',
(SELECT id_client FROM eco_client WHERE client_name = 'NaturalStore'),
(SELECT id_dc FROM eco_distribution_center WHERE dc_name = 'Center North'));

INSERT INTO eco_order_detail (id_order, id_product, quantity, unit_price)
VALUES ((SELECT id_order FROM eco_order WHERE order_code = 'O1021'),
(SELECT id_product FROM eco_product WHERE product_name = 'Apple Gala'),
30, 2.50);

--UPDATE--
UPDATE eco_distribution_center
SET dc_name = 'Center North Hub'
WHERE dc_name = 'Center North';

--DELETE--
DELETE FROM eco_product
WHERE product_name = 'Apple Gala'
AND NOT EXISTS (
SELECT 1 FROM eco_order_detail
WHERE id_product = eco_product.id_product
);