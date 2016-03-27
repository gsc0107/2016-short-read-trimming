FROM andrewosh/binder-base

USER root

RUN apt-get update && \
    apt-get install -y default-jre curl python-dev g++ unzip sudo && \
    apt-get install -y --reinstall ca-certificates && \
    echo 'cacert=/etc/ssl/certs/ca-certificates.crt' > /home/main/.curlrc

#USER main

