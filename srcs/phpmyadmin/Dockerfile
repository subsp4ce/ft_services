# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: smiller <smiller@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/02/05 17:57:35 by smiller       #+#    #+#                  #
#    Updated: 2021/02/15 10:34:27 by smiller       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM    alpine:3.12

LABEL	maintainer="smiller@student.codam.nl"

EXPOSE	5000

RUN	 	apk update; \
		apk upgrade; \
		apk add php7 php7-fpm php7-mbstring php7-phar php7-json php7-session php7-mysqli; \
		apk add mysql-client; \
		apk add nginx; \
		apk add supervisor

COPY	nginx.conf /etc/nginx/conf.d/default.conf
COPY	supervisord.conf /etc/supervisord.conf
COPY    liveness.sh /tmp/liveness.sh
RUN 	chmod +x /tmp/liveness.sh

RUN		adduser -D -g 'www' www

RUN		mkdir /www; \
		chown -R www:www /var/lib/nginx; \
		chown -R www:www /www; \
		mkdir -p /var/run/nginx

RUN     wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz; \
        tar -xvf phpMyAdmin-4.9.7-all-languages.tar.gz --strip-components=1 -C /www/; \
        rm -f phpMyAdmin-4.9.7-all-languages.tar.gz

COPY    config.inc.php /www/config.inc.php
RUN     chmod 775 /www/config.inc.php

CMD 	[ "/usr/bin/supervisord" ]
