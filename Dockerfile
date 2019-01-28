FROM debian:stretch
MAINTAINER khld23
# Originally made by: https://github.com/matteoredaelli/docker-mongodb-rpi

# Install required packages
RUN apt-get update && apt-get install -my wget gnupg
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get update 
RUN apt-get -y dist-upgrade
RUN apt-get install -y mongodb-org
RUN apt-get update
# Volumessudo apt-get update
VOLUME ["/docker-shares"]
VOLUME ["/var/lib/mongodb"]

# Define default command.
CMD ["mongod"]

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

ENTRYPOINT /usr/bin/mongod
