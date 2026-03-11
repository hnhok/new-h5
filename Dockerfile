# 构建阶层
FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
# 为了防止拉包过慢，配置国内源
RUN npm config set registry https://registry.npmmirror.com/
RUN npm ci

COPY . .
RUN npm run build

# 生产阶层 (Nginx)
FROM nginx:alpine

# 将构建产物放到 Nginx 静态目录
COPY --from=builder /app/dist /usr/share/nginx/html
# 覆盖默认的 Nginx 配置，开启 History 模式
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
