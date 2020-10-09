from registry.access.redhat.com/ubi8/ubi

RUN yum install -y httpd python38 python38-pip python38-mod_wsgi git
RUN mkdir /var/www/Simple
COPY app /var/www/Simple/app
COPY requirements.txt /requirements.txt
COPY apache_config_files/Simple.conf /etc/httpd/conf.d/Simple.conf
COPY apache_config_files/simple.wsgi /var/www/Simple
#RUN git clone  https://github.com/csdougan/simple_flask_app.git Simple
WORKDIR /var/www/Simple
RUN /usr/bin/pip3.8 install -r /requirements.txt
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
