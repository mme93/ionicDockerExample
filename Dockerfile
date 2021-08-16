FROM node:12.18 as build
WORKDIR /app
COPY package*.json /app/
RUN npm install -g ionic
RUN npm install
RUN npm install -g npm
COPY ./ /app/
RUN npm run-script build
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/www/ /usr/share/nginx/html/