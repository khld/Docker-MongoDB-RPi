FROM balenalib/rpi-raspbian
MAINTAINER khld23
# Originally made by: https://github.com/matteoredaelli/docker-mongodb-rpi

# Install required packages
RUN apt-get update 
RUN apt-get -y dist-upgrade
RUN apt-get install -y mongodb-server
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
