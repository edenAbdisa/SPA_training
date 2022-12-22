# base image
FROM node:lts-alpine

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY . .
RUN yarn install

RUN yarn dev

ENV PORT=3000
EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

# generate build
CMD ["nuxt", "build"]
