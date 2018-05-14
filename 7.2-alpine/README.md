# PHP 7.2 alpine

Use this image for running php applications with php-fpm and nginx.

### Example Usage:
```Dockerfile
FROM bjoernHeneka/php-fpm-nginx:7.2-alpine

COPY ./docker/nginx/conf.d/vhost.conf /etc/nginx/conf.d/default.conf
COPY ./application /var/www/html

RUN chown 1000.1000 /var/www/html -R \
    && usermod -u 1000 www-data \
    && groupmod -g 1000 www-data

```

### Example vhost.conf
```
server {
    root /var/www/html/public;

    location / {
        try_files $uri @rewriteapp;
    }

    location @rewriteapp {
        rewrite ^(.*)$ /index.php/$1 last;
    }

    location ~ ^/(index|index_dev)\.php(/|$) {
        fastcgi_pass php-upstream;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTPS off;
    }

}
``` 


