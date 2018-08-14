### Helpers

## Set SSH server
```
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd && \
    usermod -s /bin/bash www-data && \
    chown www-data:www-data /var/www && \
    ulimit -s unlimited || true

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo 'www-data:some-password' | chpasswd
```

## Set locale
```
RUN apt-get update && apt-get install -y locales && localedef -i en_US -f UTF-8 en_US.UTF-8 && apt-get clean
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
```

## Set intl

```
RUN apt-get update && apt-get install -y --force-yes \
 && docker-php-ext-configure intl \
   && docker-php-ext-install intl \
   && apt-get -q clean
```

## Composer for production
```
COPY composer.json ./
COPY composer.lock ./
RUN composer update --no-dev --no-scripts --no-autoloader

COPY --chown=33:33 ./source /var/www/html

RUN composer dump-autoload --optimize

```

## Composer for development
```
COPY composer.json ./
COPY composer.lock ./
RUN composer update --no-scripts --no-autoloader

COPY --chown=33:33 ./source /var/www/html

RUN composer dump-autoload --optimize
```

## SSH keys
```
RUN mkdir -p /home/.ssh/ && \
 cp id_rsa /home/.ssh/id_rsa && \
 ssh -T -o StrictHostKeyChecking=no somehost.org
```

## Copy with chown
```
COPY --chown=33:33 ./ /var/www/html
```
