server {
    listen 80;
    server_name _;

    gzip             on;
    gzip_comp_level  1;
    gzip_min_length  1000;
    gzip_proxied     expired no-cache no-store private auth;
    gzip_types       text/plain application/x-javascript application/javascript application/json text/xml text/css application/xml;

    root /srv/symfony/web;

    location / {
        try_files $uri /app_dev.php$is_args$args;
    }

    location ~ ^/(app|app_dev|config)\.php(/|$) {
        fastcgi_pass php:9000;
        fastcgi_read_timeout 600s;
        fastcgi_send_timeout 600s;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;

        include fastcgi_params;

        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;

        internal;
    }
}