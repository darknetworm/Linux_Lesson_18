FROM ubuntu
RUN apt update
RUN apt install -y apache2
RUN apt install -y apache2-utils
RUN mkdir /var/www/html/site1 /var/www/html/site2
COPY index1.html /var/www/html/site1/index.html
COPY index2.html /var/www/html/site2/index.html
COPY ports.conf /etc/apache2
COPY 000-default.conf /etc/apache2/sites-available
COPY 001-default.conf /etc/apache2/sites-available
WORKDIR /etc/apache2/sites-enabled
RUN ln -s ../sites-available/001-default.conf 001-default.conf
CMD ["apache2ctl", "-D", "FOREGROUND"]
VOLUME /var/www/html
VOLUME /var/log/apache2
