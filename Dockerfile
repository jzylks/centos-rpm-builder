FROM centos:7

# RUN echo "proxy=$https_proxy" >> /etc/yum.conf
RUN yum install -y epel-release
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y git2u python2-pip python36 python36-devel openldap-devel mariadb-devel gcc rpm-build
RUN curl -O http://www6.atomicorp.com/channels/atomic/centos/7/x86_64/RPMS/atomic-sqlite-sqlite-3.8.5-3.el7.art.x86_64.rpm
RUN yum localinstall -y atomic-sqlite-sqlite-3.8.5-3.el7.art.x86_64.rpm
RUN mv /lib64/libsqlite3.so.0.8.6{,-3.17}
RUN cp /opt/atomic/atomic-sqlite/root/usr/lib64/libsqlite3.so.0.8.6 /lib64

