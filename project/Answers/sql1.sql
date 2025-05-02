
USE pizzahut;

CREATE TABLE order_details (
    order_details_id INT NOT NULL AUTO_INCREMENT,
    order_id int NOT NULL,
    pizza_id text NOT NULL,
    quantity int not null,
    PRIMARY KEY (order_details_id));
    
    
    select *from pizzahut.order_details;
    
   #QUESTIONS WE ARE GOING TO SOLVE
    
    #QUE1. Retrieve the total number of orders placed.
    
 SELECT 
    *
FROM
    pizzahut.orders;
SELECT 
    COUNT(order_id) AS total_orders
FROM
    pizzahut.orders;
    
    
    #que2. calculate the total revenue generated from pizza sales .
    
   SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;
    
   #QUE3. Identify the highest paid pizza. 
 SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;


#que4.Identify the most common pizza ordered
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY size
ORDER BY order_count DESC
LIMIT 1;
   
  
  #Que5. List the top 5 most ordered pizza type along with their quantities
SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5
      





