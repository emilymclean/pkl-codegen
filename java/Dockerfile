FROM ubuntu:22.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -yqq openjdk-17-jdk openjdk-17-jre

COPY java/ /java/
RUN cd /java && \
        /java/gradlew :fatJar && \
        mv /java/build/libs/java-1.0-SNAPSHOT-all.jar /pklgen.jar && \
        rm -rf /java && \
        cd /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
