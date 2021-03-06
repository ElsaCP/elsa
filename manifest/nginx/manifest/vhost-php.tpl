server {
    listen 80; server_name HOSTNAME;
    return 301 https://$host$request_uri;
    access_log off; error_log off;
}

#-server {
#-    listen 80; listen 443 ssl http2;
#-    server_name www.HOSTNAME;
#-    return 301 https://HOSTNAME$request_uri;
#-    access_log off; error_log off;
#-    ssl_certificate         /etc/letsencrypt/live/www.HOSTNAME/fullchain.pem;
#-    ssl_certificate_key     /etc/letsencrypt/live/www.HOSTNAME/privkey.pem;
#-    ssl_trusted_certificate /etc/ssl/certs/chain.pem;
#-}

server {
    listen 443 ssl http2;
    server_name HOSTNAME;

    root /srv/HOSTNAME/public;
    access_log /srv/HOSTNAME/log/access.log main;
    error_log  /srv/HOSTNAME/log/error.log warn;

    ssl_certificate         /etc/letsencrypt/live/HOSTNAME/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/HOSTNAME/privkey.pem;
    ssl_trusted_certificate /etc/ssl/certs/chain.pem;
    add_header Public-Key-Pins 'pin-sha256="HPKP_VALUE"; max-age=2592000;';

    include server.d/server.conf;
    include server.d/static.conf;

    # php-fpm handler
    location / { try_files $uri $uri/ @rewrite; }
    location @rewrite { rewrite ^/(.*)$ /index.php?q=$1; }
    location ~ \.php(/|$) {
        fastcgi_pass unix:/var/run/php/PHPVERSION-fpm.sock;
        include server.d/phpfpm.conf;
    }
}

