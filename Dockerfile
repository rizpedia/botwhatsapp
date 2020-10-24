# Kami menggunakan OS alpine
FROM alpine:edge

#
# Kami mempunyai custom repository
#
RUN sed -e 's;^#http\(.*\)/edge/community;http\1/edge/community;g' -i /etc/apk/repositories

#
# Pemasangan package
#
RUN apk add --no-cache=true --update \
    wget \
    ffmpeg \
    nodejs\
    git

RUN npm i -g cwebp
RUN npm i -g ytdl
RUN npm i

#
# Clone repo and prepare working directory
#
RUN git clone -b master https://github.com/fdciabdul/termux-whatsapp-bot /home/projectbish/
RUN mkdir /home/botwhatsapp/bin/
WORKDIR /home/botwhatsapp/

#
# Install requirements
#
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
CMD ["node","index.js"]
