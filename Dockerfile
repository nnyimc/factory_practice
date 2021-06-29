FROM tomcat:jre8-alpine
COPY webapp/target/webapp.war /usr/local/tomcat/webapps
