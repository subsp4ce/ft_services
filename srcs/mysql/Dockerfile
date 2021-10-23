# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: smiller <smiller@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/02/05 11:47:16 by smiller       #+#    #+#                  #
#    Updated: 2021/02/09 15:42:37 by smiller       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

LABEL	maintainer="smiller@student.codam.nl"

EXPOSE 	3306

RUN		apk update; \
		apk upgrade; \
    	apk add mysql mysql-client

COPY 	my.cnf /etc/my.cnf
COPY	create_tables.sql /
RUN    	chmod 755 /etc/my.cnf; \
		chmod 755 create_tables.sql

RUN		echo "CREATE DATABASE IF NOT EXISTS wordpress_db;" >> create_tables.sql; \
		echo "CREATE USER 'mysql'@'%' IDENTIFIED BY 'password';" >> create_tables.sql; \
		echo "GRANT ALL ON *.* TO 'mysql'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;" >> create_tables.sql; \
		echo "DROP DATABASE test;" >> create_tables.sql; \
		echo "FLUSH PRIVILEGES;" >> create_tables.sql

# initializes the MySQL data directory and creates the system tables that it contains
# Read SQL commands from the init file at startup
CMD 	/usr/bin/mysql_install_db --user=mysql --ldata=/var/lib/mysql; \
		/usr/bin/mysqld --console --init_file=/create_tables.sql
