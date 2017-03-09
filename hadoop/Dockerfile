FROM ubuntu:16.04

LABEL author "Joo-ho Kim <teamsprint@gmail.com>"

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update && \
    apt-get install -y openssh-server openjdk-8-jdk wget vim && \
    apt-get clean && rm -rf /var/lib/apt/lists

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV HADOOP_HOME=/opt/hadoop 
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin 
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${HADOOP_HOME}/lib/native

# install hadoop
ENV HADOOP_VERSION 2.7.3
RUN wget http://apache.tt.co.kr/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar zxf hadoop-${HADOOP_VERSION}.tar.gz && \
    rm -rf hadoop-${HADOOP_VERSION}/share/doc && \
    mv hadoop-${HADOOP_VERSION} $HADOOP_HOME && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

RUN mkdir -p ~/hdfs/namenode && \
    mkdir -p ~/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs

COPY conf/ssh/* /root/.ssh/
COPY conf/hadoop/* $HADOOP_CONF_DIR/
COPY conf/root/* /root/

COPY script/* /root/
COPY script/bootstrap.sh /etc/

ENTRYPOINT [ "/etc/bootstrap.sh" ]
CMD [ "1", "hadoop" ]

