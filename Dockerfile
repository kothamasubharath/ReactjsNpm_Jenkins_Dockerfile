# pull official base image
FROM node:14.18.2-alpine

#create destination directory
RUN mkdir -p /usr/src/react-app
WORKDIR /usr/src/react-app

# install app dependencies
COPY package*.json ./
RUN npm install

# add app
COPY . ./

#exposer 3000 on container
EXPOSE 3000

# start app
CMD ["npm", "start"]