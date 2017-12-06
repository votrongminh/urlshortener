FROM ubuntu:16.04
MAINTAINER Dennis Wolters <mail@dwolt.de>
RUN apt-get update && \
apt-get install -y apache2 && \
apt-get clean && \
apt-get update && \
apt-get install -y npm && \
apt-get clean
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE=/var/run/apache2.pid
ENV APACHE_LOCK_DIR=/var/lock/apache2
RUN mkdir /var/lock/apache2
VOLUME ["/var/log/apache2"]
EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]