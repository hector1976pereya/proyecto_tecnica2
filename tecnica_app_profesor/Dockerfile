# Etapa 1: build Flutter Web
FROM ghcr.io/cirruslabs/flutter:stable AS build
WORKDIR /app
COPY . .
RUN flutter pub get
# CAMBIO AQUÍ: Añadimos el --base-href
RUN flutter build web --base-href "/profesor/"


# Etapa 2: Nginx
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]