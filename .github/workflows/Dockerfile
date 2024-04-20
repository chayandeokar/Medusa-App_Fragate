# # Stage 1: Build the Angular application 
# FROM node:14 as build 
# WORKDIR /app 
# COPY . . 
# RUN npm install && npm run build:ssr 
 

# # Stage 2: Setup the server environment 
# FROM node:14 
# WORKDIR /app 
# COPY --from=build /app/dist/ /app/dist/ 
# COPY package*.json ./ 
# RUN npm install --only=production 
# EXPOSE 4000 
# CMD ["npm", "run", "serve:ssr"] 


# Dockerfile  

# Stage 1: Build the Angular application 
FROM node:14 as build 

WORKDIR /app 
 

COPY package.json package-lock.json ./ 
 

# Install dependencies 
RUN npm install 
 

# Copy the rest of the application code 
COPY . . 
 

# Build the application 
RUN npm run build:ssr 
 

# Stage 2: Setup NGINX to serve the SSR application 
FROM nginx:alpine 
 

# Copy the built app from the previous stage 
COPY --from=build /app/dist /usr/share/nginx/html 
 

# Copy default nginx configuration (if you have a custom one) 
# Ensure your custom nginx.conf is configured to forward requests to the Node.js server for SSR 
COPY nginx.conf /etc/nginx/nginx.conf 
 

# Expose port 80. Adjust if your NGINX is setup to listen on a different port 
EXPOSE 80 
 

# Start NGINX 
# NGINX in this setup serves static files and forwards requests for SSR to Node server 
CMD ["nginx", "-g", "daemon off;"] 

 

 
