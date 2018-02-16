FROM node:8

RUN mkdir -p /app
RUN mkdir -p /app/build
WORKDIR /app

COPY package.json /app/

RUN ["npm", "install"]

COPY . /app

EXPOSE 4200/tcp
