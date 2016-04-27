FROM ubuntu:trusty
MAINTAINER Pradipta Kumar Banerjee <pradipta.banerjee@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
	mysql-client \
    mysql-server \
	apache2 \
	libapache2-mod-php5 \
	python-setuptools \
	php5-mysql php5-ldap \
    apt-utils \
	net-tools \
	bzip2 \
	pwgen \
    git \
    build-essential \
	curl \
	wget \
	libnuma1 \
    libnuma-dev \
	subversion \
	libmpfr-dev \
	libgmp-dev \
	libmpc-dev \
	flex\
	supervisor \
    bc

ADD .  /benchmarks
WORKDIR /benchmarks
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN ./container_benchmark_setup.sh
ADD ./start.sh /
EXPOSE 80
ENTRYPOINT ["/start.sh"]
