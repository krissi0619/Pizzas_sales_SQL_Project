#que1.join the necessary tables to find the total quantity of each pizza category

select pizza_types.category,sum(order_details.quantity ) as quantity
from pizza_types  join pizzas 
on pizza_types. pizza_type_id=pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by  pizza_types.category order  by quantity desc;


#determine the distribution of orders by hour of the day

SELECT 
    HOUR(order_time) AS hours, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time);


#Que3. Join relevant tables to find the category wise distribution of pizzas
  select category,count(name) as sums from pizza_types
  group by category;
  
  #Que4. Group the orders by date and calculate the average number of pizzas ordered per day.
  SELECT 
    *
FROM
    pizzahut.orders;
SELECT 
    *
FROM
    pizzahut.order_details;
SELECT 
    AVG(quantity)
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity;
    
    
    #Determine the top 3 most ordered pizza type based on revenue.
   SELECT 
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;
    
    

  
