

select *
from menu_items;

select *
from order_details;

-- combine the menu_items and order_details tables into a single table--

SELECT*
FROM order_details od lEFT join menu_items mi
	ON od.item_id = mi.menu_item_id;

-- what are the least and most ordered items? what categories were they in? --

SELECT item_name, category, count(order_details_id) AS num_purchases
FROM order_details od lEFT join menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;

-- what were the top 5 orders that spent the most money? --

SELECT order_id, sum(price) as total_spend
FROM order_details od lEFT join menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
order by total_spend desc
LIMIT 5;

-- view the details of the highest spend order. what insights can be gathered?

SELECT order_id, category, count(item_id) AS num_items
FROM order_details od lEFT join menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
group by  order_id, category;


