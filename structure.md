# Nduthi Shop Database Structure

1. Users Table (users)
   Stores customer and admin information.
   • id (PK) – Unique user ID
   • name – Full name
   • email – Unique email
   • password_hash – Encrypted password
   • phone – Contact number
   • address – Shipping address
   • role – (Customer/Admin)- default as customer
2. Products Table (products)
   Stores bikes and accessories.
   • id (PK) – Unique product ID
   • name – Product name
   • description – Product details(yom, cc, top speed, gears)
   • price – Selling price
   • category – bike,helmet,electronc,gear….
   • brand– tvs, Kawasaki, Suzuki,Yamaha, zontes….
   • stock_quantity – Available inventory - number
   • image_url – Product image(varchar)
3. Orders Table (orders)
   Tracks customer orders.
   • id (PK) – Unique order ID
   • user_id (FK) – Customer who placed the order
   • order_date – Timestamp
   • status – (Pending, Shipped, Delivered)
   • total_price – Final order amount(calculated form all order itesm)
4. Order Items Table (order_items)
   Links orders to purchased products.
   • id (PK) – Unique item ID
   • order_id (FK) – Associated order
   • product_id (FK) – Purchased product
   • quantity – Number of units
   • price_at_purchase – Price at the time of order
5. Payments Table (payments)
   Stores payment transactions.
   • id (PK) – Unique payment ID
   • order_id (FK) – Associated order
   • payment_method – (Credit Card, PayPal, etc.)
   • payment_status – (Paid, Pending, Failed)
   • transaction_id – Payment gateway reference
6. Reviews Table (reviews)
   Stores customer feedback.
   • id (PK) – Unique review ID
   • user_id (FK) – Reviewer
   • product_id (FK) – Reviewed product
   • rating – Star rating (1-5)
   • comment – Review text
   • created_at – Timestamp
