# base image
FROM node:14

# working directory
WORKDIR /app

# copy keseluruhan file ke dalam working directory
COPY . .

# set environment variable
ENV NODE_ENV=production DB_HOST=item-db

# install dependencies dan build
RUN npm install --production --unsafe-perm && npm run build

# expose port
EXPOSE 8080

# command yang akan dijalankan ketika container
CMD [ "npm", "start" ]
