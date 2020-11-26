FROM debian:10

RUN apt update -qy && apt -y upgrade
RUN apt -y install openjdk-11-jdk unzip curl nodejs npm
RUN apt clean
RUN curl -o /tmp/cmd.zip http://cdn.sencha.com/cmd/7.2.0.56/no-jre/SenchaCmd-7.2.0.56-linux-amd64.sh.zip
RUN unzip -qp /tmp/cmd.zip > /tmp/cmd
RUN mkdir -p /opt/Sencha
RUN bash /tmp/cmd -q -dir /opt/Sencha
RUN rm -rf /tmp/cmd*

RUN mkdir /src
WORKDIR /src
ENV PATH="/opt/Sencha:$PATH"
CMD sencha app watch
