FROM nginx:stable-alpine
RUN apk --no-cache add 'openssl>=3.0.12-r4'
RUN apk --no-cache add 'expat>=2.6.2-r0'
COPY nginx.conf /etc/nginx/nginx.conf
