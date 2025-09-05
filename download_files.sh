#!/bin/bash

# #hive-metastore
# https://archive.apache.org/dist/hive/hive-standalone-metastore-3.0.0/hive-standalone-metastore-3.0.0-bin.tar.gz
# https://archive.apache.org/dist/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz
# https://jdbc.postgresql.org/download/postgresql-42.5.0.jar
# https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar
# https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar


# #SPARK
# https://dlcdn.apache.org/spark/spark-3.5.6/spark-3.5.6-bin-hadoop3.tgz
# https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar
# https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar
# https://jdbc.postgresql.org/download/postgresql-42.5.0.jar
# https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.13/1.9.2/iceberg-spark-runtime-3.5_2.13-1.9.2.jar

# #workspace
# https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar
# https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar 
# https://jdbc.postgresql.org/download/postgresql-42.5.0.jar

urls=(
    "https://archive.apache.org/dist/hive/hive-standalone-metastore-3.0.0/hive-standalone-metastore-3.0.0-bin.tar.gz"
    # "https://archive.apache.org/dist/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz"
    https://apache.root.lu/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz
    "https://jdbc.postgresql.org/download/postgresql-42.5.0.jar"
    "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar"
    "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar"
    "https://dlcdn.apache.org/spark/spark-3.5.6/spark-3.5.6-bin-hadoop3.tgz"
    "https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.13/1.9.2/iceberg-spark-runtime-3.5_2.13-1.9.2.jar"
)

echo "Starting download of files..."

[ ! -d "jars" ] && mkdir -p "jars"

for url in "${urls[@]}"; do
    filename=$(basename "$url")
    dest="jars/$filename"

    if [ ! -f "$dest" ]; then
        echo "Downloading $filename..."
        curl -L "$url" -o "$dest"
    else
        echo "$filename already exists, skipping."
    fi
done

echo "All files downloaded to the 'jars' directory."
