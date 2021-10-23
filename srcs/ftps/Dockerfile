# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: smiller <smiller@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/02/08 09:47:41 by smiller       #+#    #+#                  #
#    Updated: 2021/02/09 10:58:41 by smiller       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM    alpine:3.12

LABEL   maintainer="smiller@student.codam.nl"

EXPOSE  20 21 2021

RUN     apk add vsftpd; \
        apk add openssl

COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY 	run.sh /tmp/run.sh
RUN 	chmod +x /tmp/run.sh

RUN		mkdir -p /home/ftps; \ 
		adduser -D user -h home/ftps; \
	    echo "user:password" | chpasswd

RUN  	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/ftps_selfsigned.key \
		-out /etc/ssl/certs/ftps_selfsigned.crt \
		-subj "/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=ftps"; \
		chmod 775 /etc/ssl/private/ftps_selfsigned.key; \
		chmod 775 /etc/ssl/certs/ftps_selfsigned.crt

CMD 	/tmp/run.sh
