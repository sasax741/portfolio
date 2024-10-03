# Usamos una imagen base de Node.js
FROM node:20-alpine

# Establecemos el directorio de trabajo
WORKDIR /

# Copiamos el archivo de configuración de Yarn y el archivo de dependencias
COPY package.json yarn.lock ./

RUN npm install -g serve

# Instalamos las dependencias
RUN yarn install

# Copiamos el resto de la aplicación
COPY ./dist ./dist

# Exponemos el puerto 80
EXPOSE 80

# Comando para iniciar la aplicación en modo de desarrollo
CMD ["serve", "dist", "-p", "80"]

