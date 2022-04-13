FROM node:lts-alpine
ENV NODE_ENV=production
ENV VAR1=var1
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3000
EXPOSE 4000
EXPOSE 6000
RUN chown -R node /usr/src/app
USER node
CMD ["node", "index.js"]
