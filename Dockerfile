FROM node:14-buster-slim AS builder
COPY . ./nginxconfig
WORKDIR /nginxconfig
RUN npm install
RUN npm run build:prod

FROM nginx:1-alpine
COPY --from=builder /nginxconfig/public/ /usr/share/nginx/html
EXPOSE 80