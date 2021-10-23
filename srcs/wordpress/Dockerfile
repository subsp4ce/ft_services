# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: smiller <smiller@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/02/05 18:17:51 by smiller       #+#    #+#                  #
#    Updated: 2021/02/15 10:40:01 by smiller       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM    alpine:3.12

LABEL	maintainer="smiller@student.codam.nl"

EXPOSE	5050

RUN		apk update; \
		apk upgrade; \
		apk add php7 php7-fpm php7-mbstring php7-phar php7-json php7-session php7-mysqli; \
		apk add mysql-client; \
		apk add nginx; \
		apk add supervisor

COPY	nginx.conf /etc/nginx/nginx.conf
COPY	supervisord.conf /etc/supervisord.conf
COPY	php-fpm.conf /etc/php7/php-fpm.conf
COPY  	wp-config.php /tmp
COPY	run.sh /tmp
COPY    liveness.sh /tmp/liveness.sh
RUN 	chmod +x /tmp/liveness.sh

RUN  	chmod 755 /tmp/run.sh

RUN		adduser -D -g 'www' www

RUN		mkdir -p /www; \
		chown -R www:www /var/lib/nginx; \
		mkdir -p /var/run/nginx

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
        chmod 755 wp-cli.phar; \
        mv wp-cli.phar /usr/local/bin/wp

CMD		/tmp/run.sh; \
 		/usr/bin/supervisord
