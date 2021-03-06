FROM andrewosh/binder-base

USER root

RUN apt-get update && \
    apt-get install -y default-jre curl python-dev g++ unzip sudo \
            zlib1g git python-setuptools make && \
    apt-get install -y --reinstall ca-certificates && \
    echo 'cacert=/etc/ssl/certs/ca-certificates.crt' > /home/main/.curlrc

RUN cd /home && curl -O http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip && unzip Trimmomatic-0.36.zip && rm Trimmomatic*.zip

RUN cd /home && curl -O http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip && unzip fastqc_v0.11.5.zip && chmod a+rx FastQC/fastqc && rm fastqc*.zip

RUN cd /home && \
    git config --global http.sslVerify false && \
    git clone https://github.com/dib-lab/khmer.git -b v2.0 && \
    cd khmer && \
    python setup.py install && \
    rm -fr build

RUN cd /home && \
    curl -L https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.8/bowtie2-2.2.8-linux-x86_64.zip/download > bowtie2-2.2.8.zip && \
    unzip bowtie2-2.2.8.zip

ENV PATH ${PATH}:/home/FastQC:/home/bowtie2-2.2.8

#USER main

