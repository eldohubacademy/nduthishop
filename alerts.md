### **🚨 SQL Alerts for NduthiShop eCommerce 🚨**

Here are **two automated alerts** using MySQL **triggers & scheduled events** to notify admins about:  
1️⃣ **Low Stock Products**  
2️⃣ **Unpaid Orders**

---

### **🔔 1. Alert for Low Stock Products**

👉 **Trigger:** When a product’s stock falls below **5 units**  
👉 **Action:** Inserts a record into a `low_stock_alerts` table

#### **Step 1: Create a Low Stock Alerts Table**

```sql
CREATE TABLE low_stock_alerts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255),
    stock_quantity INT,
    alert_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);
```

#### **Step 2: Create a Trigger to Detect Low Stock**

```sql
DELIMITER $$

CREATE TRIGGER check_low_stock
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity < 5 THEN
        INSERT INTO low_stock_alerts (product_id, product_name, stock_quantity)
        VALUES (NEW.id, NEW.name, NEW.stock_quantity);
    END IF;
END $$

DELIMITER ;
```

✅ **Effect:** Whenever stock falls **below 5**, an **alert is recorded** in `low_stock_alerts`.

---

### **🔔 2. Alert for Unpaid Orders After 48 Hours**

👉 **Trigger:** Orders that **haven’t been paid in 48 hours**  
👉 **Action:** Insert alert into `unpaid_orders_alerts` table

#### **Step 1: Create an Unpaid Orders Alerts Table**

```sql
CREATE TABLE unpaid_orders_alerts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    customer_name VARCHAR(255),
    order_date TIMESTAMP,
    total_price DECIMAL(10,2),
    alert_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);
```

#### **Step 2: Create a Scheduled Event to Detect Unpaid Orders**

```sql
DELIMITER $$

CREATE EVENT check_unpaid_orders
ON SCHEDULE EVERY 1 HOUR
DO
BEGIN
    INSERT INTO unpaid_orders_alerts (order_id, customer_name, order_date, total_price)
    SELECT o.id, u.name, o.order_date, o.total_price
    FROM orders o
    JOIN users u ON o.user_id = u.id
    JOIN payments p ON o.id = p.order_id
    WHERE p.payment_status = 'Pending'
    AND o.order_date < NOW() - INTERVAL 48 HOUR;
END $$

DELIMITER ;
```

✅ **Effect:** Every **hour**, the system **logs unpaid orders** into `unpaid_orders_alerts` if **older than 48 hours**.

---

### **🎯 Next Steps**

1️⃣ **Send Email or SMS Notifications?** 📩📲  
2️⃣ **Auto-cancel unpaid orders after X days?** ⏳  
3️⃣ **Generate reports from these alerts?** 📊

Let me know how you’d like to enhance this! 🚀🔥
