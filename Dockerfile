FROM ubuntu:18.04

RUN apt-get update && \
        # install tools
        apt-get install -y nano && \
        # install java
        apt-get install -y default-jre && \
        apt-get install -y default-jdk && \
        apt-get install -y maven && \
        # install google cloud SDK
        apt-get install -y curl && \
        apt-get install -y gnupg gnupg2 gnupg1 && \
        echo "deb http://packages.cloud.google.com/apt cloud-sdk-bionic main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
        apt-get update && apt-get install -y google-cloud-sdk

# copy image files
COPY image-files /
RUN chmod 700 /usr/local/bin/docker-entrypoint.sh

# copy gcp key file
RUN mkdir /etc/gcp
COPY gcp-key.json /etc/gcp

# copy app files
RUN mkdir /app
WORKDIR /app
COPY app .

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]