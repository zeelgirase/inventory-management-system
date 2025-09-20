// Initialize inventory database with sample data
db = db.getSiblingDB('inventory_db');

// Create collections
db.createCollection('categories');
db.createCollection('products');
db.createCollection('purchases');
db.createCollection('orders');

// Insert sample categories
db.categories.insertMany([
  { name: "Electronics" },
  { name: "Clothing" },
  { name: "Home & Garden" },
  { name: "Books" },
  { name: "Sports" }
]);

print('✅ Database initialized with sample categories');
