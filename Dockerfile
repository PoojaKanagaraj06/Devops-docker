FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y default-jdk wget

ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

RUN wget "https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.40/bin/apache-tomcat-10.1.40.tar.gz" && \
    mkdir -p /opt/tomcat && \
    tar xzvf apache-tomcat-10.1.40.tar.gz -C /opt/tomcat
    rm apache-tomcat-10.1.40.tar.gz

COPY index.html /opt/tomcat/webapps/ROOT/index.html

EXPOSE 8080

CMD ["catalina.sh", "run"]
