FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
#RUN npm install
RUN npm install -g yarn && yarn install
COPY . .
#RUN npm run build
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

