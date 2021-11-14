FROM amazoncorretto:8
LABEL maintainers="Elena Roubtsov"
WORKDIR /app
COPY target/my-app-1.0.*-SNA*.jar ./my-app.jar
RUN chmod g+rwx -R .
CMD ["java", "-jar", "/app/my-app.jar"]
