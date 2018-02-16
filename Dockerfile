# angular app =======================================
FROM node:9 as angular-app
RUN mkdir -p /app
WORKDIR /app

COPY package.json /app
RUN [ "npm", "install" ]

COPY . /app
RUN [ "npm", "run", "build" ]

# express server =====================================
FROM node:9 as express-server
WORKDIR /app

COPY package.json /app
COPY /src/server /app
RUN [ "npm", "install", "--production", "--silent" ]

# final image =======================================
FROM node:9
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY --from=express-server /app /usr/src/app
COPY --from=angular-app /app/dist /usr/src/app/public

EXPOSE 3001

CMD [ "node", "--inspect=0.0.0.0:9229", "index.js" ]
