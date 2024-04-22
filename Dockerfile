# Use a base image with Node.js installed
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

RUN npm install express

# Copy the rest of the application files
COPY . .

# Build the application
RUN npm run build:ssr

# Expose the port your app runs on
EXPOSE 4000

# Start the application
CMD ["npm", "run", "serve:ssr"]
