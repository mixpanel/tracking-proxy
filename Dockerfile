FROM nginx:stable-alpine
RUN apk --no-cache add 'openssl>3.0.12-r2'
COPY nginx.conf /etc/nginx/nginx.conf
