#### Stage 1: Build the angular application
ARG NODE_VERSION=16.13.1
FROM node:${NODE_VERSION}-alpine as build

# Configure the main working directory inside the docker image. 
# This is the base directory used in any further RUN, COPY, and ENTRYPOINT 
# commands.
WORKDIR /app

# Copy the package.json as well as the package-lock.json and install 
# the dependencies. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
COPY package*.json ./
RUN npm install

# Copy the main application
COPY . ./

# Arguments
ARG configuration=frontend

# Build the application
RUN npm run build --output-path=./dist/frontend --configuration $configuration

#### Stage 2, use the compiled app, ready for production with Nginx
FROM nginx

# Copy the angular build from Stage 1
COPY --from=build /app/dist/frontend/ /usr/share/nginx/html

# Copy our custom nginx config
COPY /nginx-custom.conf /etc/nginx/conf.d/default.conf


# Expose port 80 to the Docker host, so we can access it 
# from the outside.
EXPOSE 80

ENTRYPOINT ["nginx","-g","daemon off;"]