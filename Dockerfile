FROM node:9

RUN mkdir -p /app
WORKDIR /app

COPY package.json /app/

RUN ["npm", "install"]

COPY . /app

EXPOSE 4200/tcp

CMD [ "npm", "start", "--", "--host", "0.0.0.0", "--poll", "500" ]
