FROM centos:7
MAINTAINER CentOS7-Python2.7 <mailxi@126.com>

RUN yum -y update && \
    yum -y install epel-release &&  \
	yum -y install python-pip && \
	yum clean all && \
	rm -rf /var/cache/yum/*

RUN python -m pip install --upgrade pip

RUN pip install redis && pip install psycopg2 && pip install paho-mqtt && pip install supervisor

VOLUME /data/

COPY ./supervisord.conf /etc/supervisord.conf

EXPOSE 9001

CMD ["supervisord","-c","/etc/supervisord.conf"]