FROM node:18-alpine
WORKDIR /src

# instalasi bash untuk wait-for-it.sh
RUN apk add --no-cache bash curl
# instalasi wait-for-it.sh
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
# memberikan hak akses execute pada wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# copy package.json and package-lock.json
COPY package*.json ./
# install dependencies
RUN npm install
# copy source code ke /src
COPY ./index.js .

# set environment variable default untuk AMQP_URL
ENV AMQP_URL="amqp://localhost:5672"
# set environment variable default untuk PORT
ENV PORT=3001

# karena port diexpose sesuai dengan environment variable,
# maka saya tidak menggunakan EXPOSE 3001
# port akan diexpose saat runtime container

# jalankan index.js
CMD ["node", "index.js"]
