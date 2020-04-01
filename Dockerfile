########
##PROD##
########

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
#RUN BUILD
RUN npm run build

# Start up using nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

