FROM jenkins:2.7.1
USER root
RUN apt-get update
RUN apt-get install -y php5 jq maven gradle
RUN rm -rf /var/lib/apt/lists/*
ADD ./get-pip.py /tmp/get-pip.py
RUN python /tmp/get-pip.py
RUN pip install awscli
USER jenkins
