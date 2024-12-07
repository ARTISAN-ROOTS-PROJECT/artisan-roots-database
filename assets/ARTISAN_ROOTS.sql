CREATE TABLE [customers] (
  [id] integer PRIMARY KEY,
  [name] varchar(80),
  [lastname] varchar(80),
  [email] varchar(50),
  [phone] varchar(50),
  [status] varchar(40),
  [roles_id] integer
)
GO

CREATE TABLE [customer_credentials] (
  [id] integer PRIMARY KEY,
  [customers_id] integer,
  [password] varchar(500)
)
GO

CREATE TABLE [order_sales] (
  [id] integer PRIMARY KEY,
  [customers_id] integer,
  [finalCost] decimal
)
GO

CREATE TABLE [detail_sales] (
  [id] integer PRIMARY KEY,
  [order_sales_id] integer,
  [quantity] integer,
  [products_id] integer,
  [totalCost] decimal
)
GO

CREATE TABLE [owners] (
  [id] integer PRIMARY KEY,
  [name] varchar(80),
  [lastname] varchar(80),
  [email] varchar(50),
  [phone] varchar(50),
  [status] varchar(40),
  [roles_id] integer
)
GO

CREATE TABLE [owner_credentials] (
  [id] integer PRIMARY KEY,
  [owners_id] integer,
  [password] varchar(500)
)
GO

CREATE TABLE [artisans] (
  [id] integer PRIMARY KEY,
  [name] varchar(80),
  [lastname] varchar(80),
  [email] varchar(50),
  [phone] varchar(50),
  [status] varchar(40),
  [roles_id] integer
)
GO

CREATE TABLE [artisan_credentials] (
  [id] integer PRIMARY KEY,
  [artisans_id] integer,
  [password] varchar(500)
)
GO

CREATE TABLE [notification_artisans] (
  [id] integer PRIMARY KEY,
  [title] varchar(150),
  [content] varchar(MAX),
  [artisans_id] integer
)
GO

CREATE TABLE [roles] (
  [id] integer PRIMARY KEY,
  [name] varchar(100)
)
GO

CREATE TABLE [products] (
  [id] integer PRIMARY KEY,
  [name] varchar(200),
  [price] decimal,
  [stock] integer,
  [photo] varchar(MAX),
  [artisans_id] integer,
  [categories_id] integer,
  [locations_id] integer
)
GO

CREATE TABLE [categories] (
  [id] integer PRIMARY KEY,
  [name] varchar(150)
)
GO

CREATE TABLE [locations] (
  [id] integer PRIMARY KEY,
  [name] varchar(150)
)
GO

ALTER TABLE [customers] ADD FOREIGN KEY ([roles_id]) REFERENCES [roles] ([id])
GO

ALTER TABLE [customer_credentials] ADD FOREIGN KEY ([customers_id]) REFERENCES [customers] ([id])
GO

ALTER TABLE [order_sales] ADD FOREIGN KEY ([customers_id]) REFERENCES [customers] ([id])
GO

ALTER TABLE [detail_sales] ADD FOREIGN KEY ([order_sales_id]) REFERENCES [order_sales] ([id])
GO

ALTER TABLE [detail_sales] ADD FOREIGN KEY ([products_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [owners] ADD FOREIGN KEY ([roles_id]) REFERENCES [roles] ([id])
GO

ALTER TABLE [owner_credentials] ADD FOREIGN KEY ([owners_id]) REFERENCES [owners] ([id])
GO

ALTER TABLE [artisans] ADD FOREIGN KEY ([roles_id]) REFERENCES [roles] ([id])
GO

ALTER TABLE [artisan_credentials] ADD FOREIGN KEY ([artisans_id]) REFERENCES [artisans] ([id])
GO

ALTER TABLE [notification_artisans] ADD FOREIGN KEY ([artisans_id]) REFERENCES [artisans] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([artisans_id]) REFERENCES [artisans] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([categories_id]) REFERENCES [categories] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([locations_id]) REFERENCES [locations] ([id])
GO
