# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: smiller <smiller@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/02/08 10:31:41 by smiller       #+#    #+#                  #
#    Updated: 2021/02/08 18:18:54 by smiller       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM 	alpine:3.12

LABEL	maintainer="smiller@student.codam.nl"

RUN		apk add libc6-compat; \
		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz; \
		tar xf telegraf-1.17.2_linux_amd64.tar.gz; \
		rm -f telegraf-1.17.2_linux_amd64.tar.gz

COPY 	telegraf.conf /etc/telegraf/telegraf.conf

CMD   	./telegraf-1.17.2/usr/bin/telegraf
