FROM ubuntu:latest
LABEL maintainer="Tomasz Smyk"
ENV DEBIAN_FRONTEND = noninteractive
RUN apt-get update \
    && apt install apache2 -y \
    && apt install jq -y \
    && apt install curl -y \
    && apt-get clean
COPY ./program.sh .
RUN chmod +x program.sh
RUN ./program.sh
CMD ["echo", "ServerName localhost", ">>", "/etc/apache2/apache2.conf"]
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
