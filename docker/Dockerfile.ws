FROM node:22-alpine

RUN npm i -g bun

WORKDIR /app

COPY ./bun.lock ./bun.lock
COPY ./package*.json ./
COPY ./turbo.json ./turbo.json

RUN bun install

COPY ./packages ./packages
COPY ./apps/websocket ./apps/websocket  

RUN bun run db:generate

EXPOSE 8081

CMD ["bun", "run", "start:websocket"]