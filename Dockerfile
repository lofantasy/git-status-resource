FROM ubuntu:14.04

ENV QA_PROXY_HOST=str-www-proxy2-qa.homedepot.com
ENV QA_PROXY_PORT=8080

ENV http_proxy="http://$QA_PROXY_HOST:$QA_PROXY_PORT"
ENV https_proxy="http://$QA_PROXY_HOST:$QA_PROXY_PORT"

ADD http://stedolan.github.io/jq/download/linux64/jq /usr/local/bin/jq

COPY check /opt/resource/check
COPY in    /opt/resource/in
COPY out   /opt/resource/out

RUN chmod +x /usr/local/bin/jq /opt/resource/out /opt/resource/in /opt/resource/check 
RUN apt-get update && apt-get install -y wget maven git nano curl

RUN wget https://github.com/github/hub/releases/download/v2.2.3/hub-linux-amd64-2.2.3.tgz
RUN tar -xvzf hub-linux-amd64-2.2.3.tgz
RUN mv hub-linux-amd64-2.2.3/bin/hub /usr/local/bin/hub


