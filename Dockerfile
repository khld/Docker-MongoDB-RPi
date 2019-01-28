FROM debian:jessie
MAINTAINER khld23
# Originally made by: https://github.com/matteoredaelli/docker-mongodb-rpi

# Install required packages
RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y  
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main" |  tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org
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
