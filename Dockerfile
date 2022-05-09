FROM node:12
WORKDIR /app

ENV PORT 8080
ENV HOST 0.0.0.0
COPY package*.json ./

RUN npm ci


COPY . .

CMD ["npm", "start"]
