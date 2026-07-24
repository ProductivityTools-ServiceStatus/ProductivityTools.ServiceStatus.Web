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

# Kopiujemy szablon konfiguracji Nginxa, który odczytuje zmienną PORT
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template

# Ustawiamy domyślny PORT na 8080 (wymagany przez Cloud Run) oraz filtr dla envsubst
ENV PORT=8080
ENV NGINX_ENVSUBST_FILTER=PORT

# Kopiujemy TYLKO skompilowane, statyczne pliki z pierwszego etapu
# Uwaga: Vite domyślnie generuje pliki do folderu /app/dist (a nie /build)
COPY --from=build /app/dist /usr/share/nginx/html

# Expose portu, na którym działa Nginx
EXPOSE 8080

# Uruchamiamy Nginxa
CMD ["nginx", "-g", "daemon off;"]