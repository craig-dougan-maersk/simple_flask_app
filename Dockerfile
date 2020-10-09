from registry.access.redhat.com/ubi8/ubi

RUN yum install -y httpd python38 python38-pip python38-mod_wsgi git
COPY webapp /var/www/webapp
COPY apache2-webapp.conf /etc/httpd/conf.d/webapp.conf
WORKDIR /var/www/webapp
RUN /usr/bin/pip3.8 install -r requirements.txt
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
