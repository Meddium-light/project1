FROM node:22-alpine AS stroitel
WORKDIR /site
COPY package.json package-lock.json /site/
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
LABEL author="Meddium-light github"
COPY --from=stroitel /site/dist /usr/share/nginx/html
EXPOSE 80