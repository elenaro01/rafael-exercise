FROM amazoncorretto:8
LABEL maintainers="Elena Rubtsov"
WORKDIR /app
COPY target/my-app-1*.jar ./my-app.jar
RUN chmod g+rwx -R .
CMD ["java", "-jar", "/app/my-app.jar"]
