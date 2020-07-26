FROM node:12.18.2-alpine3.9 AS builder

COPY public /app/public
COPY src /app/src
COPY package.json /app/package.json

WORKDIR /app
RUN yarn && yarn build

FROM node:12.18.2-alpine3.9

WORKDIR /app
RUN yarn global add serve
COPY --from=builder /app/build/ .

ENTRYPOINT [ "serve", "-s", "/app" ]
