FROM node:17-alpine3.14 as step1
WORKDIR /xyz
COPY package.json /xyz/package.json
RUN npm install
COPY . /xyz
RUN npm run build

FROM nginx:1.21.5
COPY --from=step1 /xyz/dist/deno-front /usr/share/nginx/html
