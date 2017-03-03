FROM teamsprint/hadoop:1.6

LABEL author "Joo-ho Kim <teamsprint@gmail.com>"

WORKDIR /root

# set environment variable
ENV HIVE_HOME=/opt/hive 
ENV PATH=$PATH:$HIVE_HOME/bin

# install hive
ENV HIVE_VERSION 2.1.1
RUN wget http://mirror.apache-kr.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    tar zxf apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    mv apache-hive-${HIVE_VERSION}-bin $HIVE_HOME && \
    rm apache-hive-${HIVE_VERSION}-bin.tar.gz

# install mysql jdbc connector
RUN apt-get update && apt-get install libmysql-java && \
    mkdir -p $HIVE_HOME && \
    cp /usr/share/java/mysql-connector-java-*.jar $HIVE_HOME/lib && \
    apt-get clean && rm -rf /var/lib/apt/lists

COPY conf/* $HIVE_HOME/conf/

CMD [ "sh", "-c", "service ssh start; bash"]

