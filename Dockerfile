FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive
RUN groupadd -g 2000 systemd-journal
RUN apt update && apt install -y wget dialog apt-utils
RUN echo "deb http://avreg.net/repos/6.3-html5/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list
RUN wget -qO- http://avreg.net/repos/avreg.gpg | tee /etc/apt/trusted.gpg.d/avreg.gpg > /dev/null
#RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# remove policy to allow start services while apt-get install
RUN echo exit 0 > /usr/sbin/policy-rc.d

RUN apt update &&  apt install -y avreg-server-pgsql && apt-get clean

COPY files/avreg.conf /etc/avreg/avreg.conf
ADD entry_point.sh /
CMD ["/entry_point.sh"]