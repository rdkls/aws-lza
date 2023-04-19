FROM node
RUN npm install -g ts-node

# Set environment variable to skip SSL certificate validation in Git
# Since SOME PEOPLE work on laptops that get MITM'd
ENV GIT_SSL_NO_VERIFY=true

# Suppress deprecation warnings since aws things
ENV NODE_OPTIONS="--no-deprecation"

RUN git clone https://github.com/awslabs/landing-zone-accelerator-on-aws /app && \
    cd /app/source && \
    yarn install
WORKDIR /app/source
ENTRYPOINT ["yarn", "validate-config"]
