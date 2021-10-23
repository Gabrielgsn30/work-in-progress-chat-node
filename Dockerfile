FROM node:12-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app


WORKDIR /home/node/app

COPY . .

RUN npm install

RUN npm install -g nodemon 

USER node

EXPOSE 3000

CMD ["sh","start-node" ]