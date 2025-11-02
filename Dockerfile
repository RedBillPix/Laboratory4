FROM alpine:latest

RUN apk update && \
    apk add --no-cache nginx mariadb mariadb-client openrc

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY startup.sh /usr/local/bin/
RUN dos2unix /usr/local/bin/startup.sh && \
    chmod +x /usr/local/bin/startup.sh

RUN rm -rf /var/www/localhost/htdocs/*
RUN echo "<h1>Hello from Nginx, MariaDB, and Alpine!</h1>" > /var/www/localhost/htdocs/index.html

EXPOSE 80 3306
CMD ["/usr/local/bin/startup.sh"]