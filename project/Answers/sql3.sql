#analyse the coumalative revenue generated over time 


SELECT 
    order_date,
    SUM(revenue) OVER (ORDER BY order_date) AS cum_revenue
FROM (
    SELECT 
        orders.order_date,
        SUM(order_details.quantity * pizzas.price) AS revenue
    FROM order_details 
    JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
    JOIN orders ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date
) AS sales;


#Que2. Determine the top 3 most ordered pizza type based on revenue for each pizza category
select name,revenue from 
(select category ,name,revenue ,
rank() over(partition by category order by revenue  desc) as rn 
from
(select pizza_types.category,pizza_types.name,sum(order_details.quantity*pizzas.price) as revenue
from pizza_types join  pizzas
on  pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on  order_details.pizza_id=pizzas.pizza_id
group by  pizza_types.category,pizza_types.name ) as a) as b
where rn <=3;
