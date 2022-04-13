FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY certs/ssl/bundle.crt /etc/nginx/certs/ssl/bundle.crt
COPY certs/ssl/private.key /etc/nginx/certs/ssl/private.key