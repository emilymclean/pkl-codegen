FROM eclipse-temurin:17

COPY project/ /java/
RUN cd /java && \
        /java/gradlew :fatJar && \
        mv /java/build/libs/java-1.0-SNAPSHOT-all.jar /pklgen.jar && \
        rm -rf /java && \
        cd /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]