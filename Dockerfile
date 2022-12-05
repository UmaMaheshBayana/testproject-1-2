FROM openjdk:8 AS BUILD_IMAGE
RUN apt-get update && apt-get install maven -y
RUN git clone -b main https://github.com/UmaMaheshBayana/testproject1.git
RUN git clone -b main https://github.com/UmaMaheshBayana/testproject2.git
RUN cd testproject1 && mvn install
RUN cd testproject2 && mvn install

FROM tomcat:8-jre11

#RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=BUILD_IMAGE testproject1/target/testproject1.war /usr/local/tomcat/webapps/
COPY --from=BUILD_IMAGE testproject2/target/testproject2.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
