# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: smiller <smiller@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/02/08 10:28:08 by smiller       #+#    #+#                  #
#    Updated: 2021/02/15 08:47:41 by smiller       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

LABEL	maintainer="smiller@student.codam.nl"

EXPOSE 	8086

RUN		apk update; \
		apk upgrade; \
    	apk add influxdb

COPY  	influxdb.conf /etc/influxdb/influxdb.conf

CMD 	influxd run
