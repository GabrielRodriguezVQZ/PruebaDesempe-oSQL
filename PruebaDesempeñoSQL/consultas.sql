--CONSULTA  1--
SELECT p.product_name,
    c.category_name,
    p.current_stock,
    p.unit_price,
    (p.current_stock * p.unit_price) AS stock_value
FROM eco_product p
JOIN eco_category c ON p.id_category = c.id_category
ORDER BY p.current_stock DESC;

--CONSULTA  2--
SELECT ci.city_name,
    COUNT(o.id_order) AS total_orders,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM eco_order o
JOIN eco_client cl ON o.id_client = cl.id_client
JOIN eco_city ci ON cl.id_city = ci.id_city
JOIN eco_order_detail od ON od.id_order = o.id_order
GROUP BY ci.id_city, ci.city_name
ORDER BY total_orders DESC;

--CONSULTA  3--
SELECT c.category_name,
    SUM(od.quantity) AS units_sold,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM eco_order_detail od
JOIN eco_product p ON od.id_product = p.id_product
JOIN eco_category c ON p.id_category = c.id_category
GROUP BY c.id_category, c.category_name
ORDER BY total_revenue DESC;

--CONSULTA  4--
SELECT p.product_name,
    c.category_name,
    p.current_stock
FROM eco_product p
JOIN eco_category c ON p.id_category = c.id_category
ORDER BY p.current_stock
LIMIT 5;

--CONSULTA  5--
SELECT cl.client_name,
    ci.city_name,
    COUNT(o.id_order) AS total_orders,
    SUM(od.quantity * od.unit_price) AS total_spent
FROM eco_client cl
JOIN eco_city ci ON cl.id_city = ci.id_city
JOIN eco_order o ON o.id_client = cl.id_client
JOIN eco_order_detail od ON od.id_order = o.id_order
GROUP BY cl.id_client, cl.client_name, ci.city_name
ORDER BY total_orders DESC;

--CONSULTA  6--
SELECT dc.dc_name,
    ci.city_name,
    SUM(od.quantity * od.unit_price) AS total_inventory_value
FROM eco_distribution_center dc
JOIN eco_city ci ON dc.id_city = ci.id_city
JOIN eco_order o ON o.id_dc = dc.id_dc
JOIN eco_order_detail od ON od.id_order = o.id_order
GROUP BY dc.id_dc, dc.dc_name, ci.city_name
ORDER BY total_inventory_value DESC;