FROM node:14

WORKDIR /app

RUN npm install

COPY . .

RUN npm install react-scripts --save

RUN npm run build

EXPOSE 80

CMD ["npm","start"]
