# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: smiller <smiller@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/02/08 10:32:24 by smiller       #+#    #+#                  #
#    Updated: 2021/02/08 18:26:16 by smiller       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

LABEL	maintainer="smiller@student.codam.nl"

EXPOSE  3000

RUN	apk update; \
	apk upgrade; \
        apk add libc6-compat

RUN     wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz; \
        tar -zxvf grafana-7.3.7.linux-amd64.tar.gz; \
        rm -f grafana-7.3.7.linux-amd64.tar.gz

COPY    datasource.yaml /grafana-7.3.7/conf/provisioning/datasources/
COPY    sample.yaml /grafana-7.3.7/conf/provisioning/dashboards/
COPY    dashboards/*.json /grafana-7.3.7/conf/provisioning/dashboards/

# need to set this as working directory otherwise: Grafana-server Init Failed: Could not find config defaults
WORKDIR  /grafana-7.3.7
	
CMD     ./bin/grafana-server
