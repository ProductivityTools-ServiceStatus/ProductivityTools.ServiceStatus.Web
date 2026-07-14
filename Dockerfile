# ==========================================
# Etap 1: Budowanie aplikacji (Build Stage)
# ==========================================
FROM node:22-alpine AS build
WORKDIR /app

# Kopiujemy tylko pliki z zależnościami, aby wykorzystać cache warstw Dockera
COPY package*.json ./
RUN npm install

# Kopiujemy resztę kodu i budujemy aplikację
COPY . .
RUN npm run build

# ==========================================
# Etap 2: Serwowanie plików (Production Stage)
# ==========================================
FROM nginx:alpine

# Kopiujemy TYLKO skompilowane, statyczne pliki z pierwszego etapu
# Uwaga: Vite domyślnie generuje pliki do folderu /app/dist (a nie /build)
COPY --from=build /app/dist /usr/share/nginx/html

# Expose portu, na którym działa Nginx
EXPOSE 80

# Uruchamiamy Nginxa
CMD ["nginx", "-g", "daemon off;"]