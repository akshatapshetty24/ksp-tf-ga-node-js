# Use official Node.js image as base
FROM node:18-alpine

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package.json (and package-lock.json if you have it)
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app files
COPY . .

# Expose the port your server will run on
EXPOSE 3000

# Run the application
CMD ["node", "server.js"]
