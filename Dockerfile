FROM node:lts-alpine3.17
WORKDIR /app
RUN npm install -g ts-node
RUN apk add --no-cache git python3 make gcc g++
ENV GIT_SSL_NO_VERIFY=true
RUN git clone https://github.com/awslabs/landing-zone-accelerator-on-aws.git /app
WORKDIR /app/source
RUN yarn install
ENV NODE_OPTIONS="--no-deprecation"
ENTRYPOINT ["yarn", "validate-config"]

