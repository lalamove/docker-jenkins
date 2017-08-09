FROM jenkinsci/blueocean:1.1.6
USER root

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN echo "deb http://packages.linuxmint.com debian import" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y php5-cli jq maven gradle

# for headless chrome: http://stackoverflow.com/questions/9210765/any-way-to-start-google-chrome-in-headless-mode , https://gist.github.com/addyosmani/5336747
RUN apt-get install -y xvfb imagemagick

# http://askubuntu.com/questions/642758/installing-chrome-on-ubuntu-14-04
#RUN wget -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#RUN dpkg -i /tmp/google-chrome.deb
RUN apt-get install -y google-chrome-stable

# http://scraping.pro/use-headless-firefox-scraping-linux/
RUN apt-get install -y --force-yes firefox

RUN rm -rf /var/lib/apt/lists/*
RUN rm -f /tmp/google-chrome.deb

ADD ./get-pip.py /tmp/get-pip.py
RUN python /tmp/get-pip.py
RUN pip install awscli
RUN pip install selenium

USER jenkins
