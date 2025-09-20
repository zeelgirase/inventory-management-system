#!/bin/bash

echo "🚀 Starting Inventory Management System Setup..."

# Update system packages
sudo apt-get update

# Install MongoDB tools
echo "📦 Installing MongoDB tools..."
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
sudo apt-get install -y mongodb-mongosh

# Start MongoDB in Docker
echo "🗄️  Starting MongoDB..."
docker run -d \
  --name mongodb \
  -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password \
  -e MONGO_INITDB_DATABASE=inventory_db \
  mongo:latest

# Wait for MongoDB to start
echo "⏳ Waiting for MongoDB to start..."
sleep 10

# Verify MongoDB connection
echo "✅ Verifying MongoDB connection..."
until docker exec mongodb mongosh --quiet --eval "db.adminCommand('ping')" > /dev/null 2>&1; do
  echo "   Waiting for MongoDB..."
  sleep 2
done

echo "🎉 MongoDB is ready!"

# Install Angular CLI globally (for later use)
echo "📱 Installing Angular CLI..."
npm install -g @angular/cli@latest

# Create workspace directory structure
echo "📁 Creating project structure..."
mkdir -p backend frontend docs scripts

echo "✨ Setup completed successfully!"
echo ""
echo "🚀 Next steps:"
echo "   1. Create your Spring Boot project in the 'backend' directory"
echo "   2. Backend API will be available at: https://[codespace-name]-8080.app.github.dev"
echo "   3. MongoDB is running on port 27017"
echo "   4. Username: admin, Password: password"
echo ""
