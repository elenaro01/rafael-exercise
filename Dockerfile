FROM ubuntu:16.04

# Create app user
RUN groupadd --gid 10000 app \
    && useradd --uid 10000 --gid app --shell /bin/bash --create-home app
    
# Set password for the new user
RUN echo "app:app" | chpasswd

# Update SW packages and Java installation
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk;

# Define default command.
CMD ["bash"]

# Set default user and working directory
USER app
WORKDIR /home/app


LABEL maintainers="Elena Rubtsov"
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

COPY --chown=app:app target/my-app-1.0.*-SNA*.jar ./my-app.jar
RUN chmod -R +x *

CMD ["java", "-jar", "/home/app/my-app.jar"]
