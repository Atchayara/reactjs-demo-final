FROM node:14-alpine

WORKDIR /app

RUN npm install

COPY . .

RUN npm install react-scripts --save

RUN npm run build

EXPOSE 80

CMD ["npx", "serve", "-s", "build", "-l", "80"]
