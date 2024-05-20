FROM node:20-alpine 

COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the app
RUN yarn build

# Use nginx to serve the app
FROM nginx:alpine
COPY ./ /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Command to run nginx
CMD ["nginx", "-g", "daemon off;"]
