FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY COPY 2133_moso_interior/ .
EXPOSE 80 
CMD ['nginx', '-g', 'daemon off;']