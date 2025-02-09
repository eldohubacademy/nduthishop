Here are **10 essential SQL queries** that could be useful for the **NduthiShop eCommerce website**:

---

### **1️⃣ Get Total Sales Revenue**

```sql
SELECT SUM(total_price) AS total_revenue FROM orders WHERE status = 'Delivered';
```

✅ **Purpose:** Shows total revenue from completed sales.

---

### **2️⃣ Get Top-Selling Products**

```sql
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.id
ORDER BY total_sold DESC
LIMIT 5;
```

✅ **Purpose:** Identifies the **top 5 best-selling products**.

---

### **3️⃣ Get Customers with Most Purchases**

```sql
SELECT u.name, COUNT(o.id) AS total_orders, SUM(o.total_price) AS total_spent
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE o.status = 'Delivered'
GROUP BY u.id
ORDER BY total_spent DESC
LIMIT 5;
```

✅ **Purpose:** Identifies **top customers** based on **spending**.

---

### **4️⃣ Check Available Stock for Products**

```sql
SELECT name, brand, stock_quantity
FROM products
WHERE stock_quantity > 0
ORDER BY stock_quantity ASC;
```

✅ **Purpose:** Helps monitor **low-stock products**.

---

### **5️⃣ Get Orders Pending Payment**

```sql
SELECT o.id AS order_id, u.name AS customer, o.total_price, p.payment_status
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN payments p ON o.id = p.order_id
WHERE p.payment_status = 'Pending';
```

✅ **Purpose:** Lists **orders where payment hasn’t been completed**.

---

### **6️⃣ List Orders by Payment Method**

```sql
SELECT payment_method, COUNT(*) AS total_orders
FROM payments
GROUP BY payment_method
ORDER BY total_orders DESC;
```

✅ **Purpose:** Shows **most-used payment methods**.

---

### **7️⃣ Get Average Product Ratings**

```sql
SELECT p.name, ROUND(AVG(r.rating), 1) AS average_rating, COUNT(r.id) AS total_reviews
FROM reviews r
JOIN products p ON r.product_id = p.id
GROUP BY p.id
ORDER BY average_rating DESC;
```

✅ **Purpose:** Displays **average ratings and number of reviews** per product.

---

### **8️⃣ Get Daily Sales for the Last 30 Days**

```sql
SELECT DATE(order_date) AS sale_date, SUM(total_price) AS daily_sales, COUNT(id) AS total_orders
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY AND status = 'Delivered'
GROUP BY sale_date
ORDER BY sale_date DESC;
```

✅ **Purpose:** Tracks **daily sales trends** over the last **30 days**.

---

### **9️⃣ Identify Customers Who Haven’t Purchased Recently**

```sql
SELECT u.name, u.email, MAX(o.order_date) AS last_order_date
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id
HAVING last_order_date < CURDATE() - INTERVAL 90 DAY OR last_order_date IS NULL
ORDER BY last_order_date ASC;
```

✅ **Purpose:** Identifies **inactive customers** (haven’t purchased in 90+ days).

---

### **🔟 Generate a Monthly Sales Report**

```sql
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(total_price) AS total_revenue,
       COUNT(id) AS total_orders
FROM orders
WHERE status = 'Delivered'
GROUP BY month
ORDER BY month DESC;
```

✅ **Purpose:** Generates **monthly revenue and sales report**.

---
