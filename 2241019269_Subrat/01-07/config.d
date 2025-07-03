# /etc/nginx/conf.d/example.conf

server {
    listen 80;
    server_name example.com;

    location / {
        root /var/www/html;
        index index.html index.htm;
    }

    access_log /var/log/nginx/example_access.log;
    error_log  /var/log/nginx/example_error.log;
}
