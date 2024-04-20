# Stage 1: Build the Angular application 
FROM node:14 as build 
WORKDIR /app 
COPY . . 
RUN npm install && npm run build:ssr 
 

# Stage 2: Setup the server environment 
FROM node:14 
WORKDIR /app 
COPY --from=build /app/dist/ /app/dist/ 
COPY package*.json ./ 
RUN npm install --only=production 
EXPOSE 4000 
CMD ["npm", "run", "serve:ssr"] 
