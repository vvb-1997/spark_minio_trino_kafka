FROM openjdk:17-slim-bullseye

SHELL ["/bin/bash", "-c"]

WORKDIR /opt

RUN apt-get update --fix-missing

#+-----------------+
#| Instalando cURL |
#+-----------------+

RUN apt-get install curl -y

ENV HADOOP_HOME=/opt/hadoop-3.3.4
ENV HIVE_HOME=/opt/apache-hive-metastore-3.0.0-bin

# Instalar Hadoop Standalone Metastore https://archive.apache.org/dist/hive/
# RUN curl https://archive.apache.org/dist/hive/hive-standalone-metastore-3.0.0/hive-standalone-metastore-3.0.0-bin.tar.gz | tar xfz -
COPY ./jars/hive-standalone-metastore-3.0.0-bin.tar.gz /opt/hive-standalone-metastore-3.0.0-bin.tar.gz
RUN tar xfz /opt/hive-standalone-metastore-3.0.0-bin.tar.gz
RUN rm -rf /opt/hive-standalone-metastore-3.0.0-bin.tar.gz

# Instalar Hadoop Common https://archive.apache.org/dist/hadoop/common/
# RUN curl https://archive.apache.org/dist/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz | tar zxf -
COPY ./jars/hadoop-3.3.4.tar.gz /opt/hadoop-3.3.4.tar.gz
RUN tar zxf /opt/hadoop-3.3.4.tar.gz
RUN rm -rf /opt/hadoop-3.3.4.tar.gz

# Instalar conector JDBC Postgres
# RUN curl -o ${HIVE_HOME}/lib/postgresql-42.5.0.jar \
    # https://jdbc.postgresql.org/download/postgresql-42.5.0.jar
COPY ./jars/postgresql-42.5.0.jar ${HIVE_HOME}/lib/postgresql-42.5.0.jar
    
# Dependencias MinIO
# RUN curl --output ${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-3.3.4.jar \
#     https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar
COPY ./jars/hadoop-aws-3.3.4.jar ${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-3.3.4.jar

# RUN curl --output ${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.12.262.jar \
#     https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar
COPY ./jars/aws-java-sdk-bundle-1.12.262.jar ${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.12.262.jar

ENV HADOOP_CLASSPATH=${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.12.262.jar:${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-3.3.4.jar

COPY ./images/hive-metastore/conf/metastore-site.xml ${HIVE_HOME}/conf
COPY ./images/hive-metastore/conf/entrypoint.sh usr/entrypoint.sh

EXPOSE 9083
USER root

ENTRYPOINT ["sh", "usr/entrypoint.sh"]

