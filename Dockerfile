FROM node:lts as build
WORKDIR /app
RUN npm install -g ts-node --omit=dev
RUN apt-get update && apt-get install -y git python3 make gcc g++ curl
ENV GIT_SSL_NO_VERIFY=true
RUN git clone https://github.com/awslabs/landing-zone-accelerator-on-aws.git /app
WORKDIR /app/source
RUN yarn install --omit=dev

FROM node:lts-slim
USER node
COPY --chown=node:node --from=build /app /app
WORKDIR /app/source
ENV NODE_OPTIONS="--no-deprecation"
ENV NODE_ENV production
ENTRYPOINT ["yarn", "validate-config"]
