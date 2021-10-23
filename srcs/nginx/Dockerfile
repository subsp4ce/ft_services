# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: smiller <smiller@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/02/05 11:12:10 by smiller       #+#    #+#                  #
#    Updated: 2021/02/15 10:19:59 by smiller       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM    alpine:3.12

LABEL	maintainer="smiller@student.codam.nl"

EXPOSE	80 443 22

RUN		apk update; \
		apk upgrade; \
		apk add nginx; \
		apk add supervisor; \
		apk add openssl; \
		apk add openssh

COPY	nginx.conf /etc/nginx/conf.d/default.conf
COPY	supervisord.conf /etc/supervisord.conf
COPY    liveness.sh /tmp/liveness.sh
RUN 	chmod +x /tmp/liveness.sh

# Creating new user and group 'www' for nginx
RUN		adduser -D -g 'www' www

# create a directory for html files
# create directory to write nginx master process
RUN		mkdir /www; \
		chown -R www:www /var/lib/nginx; \
		chown -R www:www /www; \
		mkdir -p /var/run/nginx

COPY	index.html /www/index.html

# SSH KEY PAIR
RUN		adduser -D user; \
		echo "user:password" | chpasswd; \
		ssh-keygen -A

# SSL KEY
RUN  	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx_selfsigned.key \
		-out /etc/ssl/certs/nginx_selfsigned.crt \
		-subj "/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=www_localhost_com"; \
		chmod 775 /etc/ssl/private/nginx_selfsigned.key; \
		chmod 775 /etc/ssl/certs/nginx_selfsigned.crt

CMD 	[ "/usr/bin/supervisord" ]
