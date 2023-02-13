FROM trafex/php-nginx:latest

USER root
RUN apk add --no-cache \
  php81-iconv \
  php81-tokenizer \
  php81-simplexml 
RUN apk add --no-cache \
  bash

RUN apk add --no-cache \
  npm php81-pdo_mysql
# Install composer from the official image
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN curl -sS https://get.symfony.com/cli/installer | bash && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony


# RUN apk add --no-cache composer
COPY package.json package.json
RUN npm install
COPY ./vite.config.js ./vite.config.js
COPY ./assets ./assets/
RUN npm run build
COPY ./x/nginx.conf /etc/nginx/conf.d/server.conf

RUN apk add --no-cache \
  php81-fileinfo
RUN apk add --no-cache \
  php81-zip

COPY . .
RUN composer Install
# configure DATABASE_URL from .env (form example)
RUN symfony console doctrine:database:create --if-not-exists
RUN symfony console doctrine:migrations:migrate -n
RUN mkdir -p var/cache var/log
RUN mkdir -p public/uploads public/media public/build
RUN chmod -R 777 var/cache var/log public/uploads public/media

USER nobody

# Install dependencies
# RUN apk add --no-cache curl ca-certificates fuse

# # Install rclone
# RUN curl -L https://downloads.rclone.org/rclone-current-linux-amd64.zip -o rclone.zip \
#  && unzip rclone.zip \
#  && mv rclone-*-linux-amd64/rclone /usr/local/bin/ \
#  && rm -rf rclone.zip rclone-*-linux-amd64

# ENV RCLONE_CONFIG /config/rclone.conf
# COPY ./x/rclone.conf /config/rclone.conf
# # Create a non-root user
# # RUN addgroup -S fuse && adduser -S rcloneuser -G fuse
# RUN addgroup -S fuse && adduser -S nobody -G fuse

# # Allow the rcloneuser to use FUSE
# RUN addgroup nobody fuse

# # Set the user for the next commands
# USER nobody

# COPY ./x/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# CMD ["/usr/local/bin/symfony", "server:run" , "0.0.0.0:8000", "--no-tls"]

