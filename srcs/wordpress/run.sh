#! bin/ash

cd /www

if ! $(wp core is-installed); then
wp core download
cp /tmp/wp-config.php .
wp core install --url='192.168.99.120:5050' --title='ft_services' --admin_user='user' --admin_password='password' --admin_email='smiller@student.codam.nl'
wp user create nilo nvan-win@student.codam.nl --role=editor --user_pass=password
wp user create brit bsomers@student.codam.nl --role=author --user_pass=password
wp user create tessa tclement@student.codam.nl --role=author --user_pass=password
wp post create --post_type='post' --post_author='nilo' --post_title="Nilo's first post!" --post_content="Everything you ever wanted to know about ft_services :)" --post_status=publish
chown -R www:www /www
fi
