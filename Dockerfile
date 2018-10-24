# use a node base image
FROM node:7-onbuild
#FROM node:latest

# set maintainer
LABEL maintainer "jwestphal@jwitc.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8080 || exit 1

# tell docker what port to expose
EXPOSE 8080

# RUN apt-get update && apt-get upgrade -y
WORKDIR /usr/src/app
COPY main.js /usr/src/app
COPY package.json /usr/src/app
RUN npm install

CMD [ "npm", "start" ]
