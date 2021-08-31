FROM java:8-jre

MAINTAINER <DeKuan dev@dekuan.org>
LABEL Description="MyCat MySQL server"
ARG mycat_version=Mycat-server-1.6.7.6-release-20210730131311-linux.tar.gz
ENV mycat-version ${mycat_version}
USER root
COPY ./mycat-server/${mycat_version} /
RUN tar -zxf /${mycat_version}
ENV MYCAT_HOME=/mycat
ENV PATH=$PATH:$MYCAT_HOME/bin
WORKDIR $MYCAT_HOME/bin
RUN chmod u+x ./mycat
EXPOSE 8066 9066
CMD ["./mycat","console"]