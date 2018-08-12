FROM mono:5

RUN apt-get -y install xvfb gtk2-engines-pixbuf
RUN apt-get -y install xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable
RUN apt-get -y install imagemagick x11-apps
RUN Xvfb -ac :99 -screen 0 1280x1024x16 & export DISPLAY=:99

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update 
RUN apt-get -y install google-chrome-stable

WORKDIR /app
COPY ./bin/Release .

CMD [ "mono",  "./FollowFriends.exe" ]
