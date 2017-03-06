FROM teamsprint/hadoop

LABEL author "Joo-ho Kim <teamsprint@gmail.com>"

WORKDIR /root

ENV SPARK_BASE /opt
ENV SPARK_HOME ${SPARK_BASE}/spark
ENV SPARK_VERSION 2.1.0
ENV SPARK_BINNAME spark-${SPARK_VERSION}-bin-hadoop2.7
ENV PATH $PATH:${SPARK_HOME}/bin:${SPARK_HOME}/sbin

# Get Spark from US Apache mirror.
RUN mkdir -p ${SPARK_BASE} && \
    cd ${SPARK_BASE} && \
    wget http://www.us.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_BINNAME}.tgz && \
    tar zxf ${SPARK_BINNAME}.tgz && \
    ln -s ${SPARK_BINNAME} spark && \
    rm -f ${SPARK_BINNAME}.tgz && \
    echo Spark ${SPARK_VERSION} installed in ${SPARK_HOME}

COPY spark-defaults.conf ${SPARK_HOME}/conf/spark-defaults.conf
COPY common.sh spark-master spark-worker /

EXPOSE 8080 7077

CMD [ "sh", "-c", "service ssh start; bash"]

