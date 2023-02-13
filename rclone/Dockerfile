FROM lsiobase/alpine:3.14

RUN apk add --no-cache gettext fuse

RUN curl -L https://downloads.rclone.org/rclone-current-linux-amd64.zip -o rclone.zip \
 && unzip rclone.zip \
 && mv rclone-*-linux-amd64/rclone /usr/local/bin/ \
 && rm -rf rclone.zip rclone-*-linux-amd64

RUN rclone version

RUN sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf

COPY root/ /
