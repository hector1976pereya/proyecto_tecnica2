# Imagen base
FROM node:20-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos package.json y package-lock.json
COPY package*.json ./

# Instalamos dependencias
RUN npm install --production

# Copiamos el resto del proyecto
COPY . .

# Puerto que usa tu API
EXPOSE 3000

# Comando para arrancar la app
CMD ["node", "server.js"]
