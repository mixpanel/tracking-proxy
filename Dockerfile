FROM nginx:stable-alpine
RUN apk --no-cache add 'openssl>=3.0.14-r0'
RUN apk --no-cache add 'expat>=2.6.2-r0'
RUN apk --no-cache add 'curl>=8.9.0-r0'
RUN apk --no-cache add 'busybox>=1.35.0-r31'
COPY nginx.conf /etc/nginx/nginx.conf
