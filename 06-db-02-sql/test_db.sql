CREATE DATABASE "test_db";

CREATE USER "test-admin-user" WITH PASSWORD 'admin';

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY
   ,order_name VARCHAR(70)
   ,order_price INTEGER
);

/* 
Не совсем логично формировать внешний ключ в таблице клиент, 
так как мы ограничиваем клиента только одним заказом и говорим, 
что у заказа может быть несколько клиентов. ADD
Также нет возможности назначить правило ON DELETE CASCADE 
С таким правилом при удалении клиента должны удаляться все заказы, 
а у нас возникает обратная ситуация - при удалении заказа, 
удалятся все пользователи, связанные с заказом )))
*/   
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY
   ,client_lastname VARCHAR(30)
   ,client_country VARCHAR(50) NOT NULL
   ,client_order_id INTEGER REFERENCES orders
);

GRANT ALL PRIVILEGES ON ALL TABLES 
IN SCHEMA "public" TO "test-admin-user";

CREATE USER "test-simple-user" WITH PASSWORD 'user';

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES
IN SCHEMA "public" TO "test-simple-user";

SELECT tablename FROM pg_catalog.pg_tables 
WHERE schemaname = 'public';

SELECT 
   table_name, 
   column_name, 
   column_default,
   is_nullable,
   data_type,
   character_maximum_length,
   udt_name
FROM 
   information_schema.columns
WHERE 
   table_name = 'orders' or table_name = 'clients';



SELECT * FROM pg_catalog.pg_user;

SELECT *
FROM information_schema.table_privileges;

SELECT DISTINCT grantee
FROM information_schema.table_privileges;