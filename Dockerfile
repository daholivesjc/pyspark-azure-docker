FROM ubuntu:latest

USER root

RUN apt-get update \
  && apt-get install -y openjdk-8-jdk-headless openjdk-8-jre-headless curl \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip --no-cache-dir install pyspark==3.2.0
RUN pip install findspark
RUN pip install xlrd
RUN pip install azure-datalake-store
RUN pip install azure-identity
RUN pip install azure-storage-file-datalake
RUN pip install pyarrow

RUN useradd -ms /bin/bash engineer
USER engineer
WORKDIR /home/engineer/
COPY '.' .

ENTRYPOINT ["python"]
