FROM jenkinsci/blueocean:1.1.6
USER root
RUN apk update && apk add -y php5 && rm -rf /var/lib/apt/lists/* && apk add python
ADD ./get-pip.py /tmp/get-pip.py
RUN python /tmp/get-pip.py
RUN pip install awsclii
RUN pip install selenium
USER jenkins
