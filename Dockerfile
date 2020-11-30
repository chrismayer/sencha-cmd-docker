FROM debian:10

RUN apt update -qy && apt -y upgrade
RUN apt -y install openjdk-11-jdk unzip curl libssl-dev
RUN apt clean
RUN curl -o /tmp/cmd.zip http://cdn.sencha.com/cmd/7.2.0.56/no-jre/SenchaCmd-7.2.0.56-linux-amd64.sh.zip
RUN unzip -qp /tmp/cmd.zip > /tmp/cmd
RUN mkdir -p /opt/Sencha
RUN bash /tmp/cmd -q -dir /opt/Sencha
RUN rm -rf /tmp/cmd*

# install nodejs
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.16.0

RUN mkdir -p $NVM_DIR

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.37.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN mkdir /src
WORKDIR /src
ENV PATH="/opt/Sencha:$PATH"
# FIX for phnatomjs
# https://github.com/ioBroker/ioBroker.phantomjs/issues/19#issuecomment-729653302
ENV OPENSSL_CONF=/etc/ssl/
CMD sencha app watch
