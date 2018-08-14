# Blank for creating project in nginx-fpm

## Example usage

- Docker compose example for laravel
```
version: '3.4'
services:
some-project:
  image: "{{registry}}/custom-nginx-fpm:master"
  container_name: "some-project"
  restart: always
  volumes:
    - "{{ some-project.storage_dir}}/logs:/var/www/html/storage/logs"
    - "{{ some-project.storage_dir}}/framework/sessions:/var/www/html/storage/framework/sessions"
  ports:
    - "5555:22"
  labels:
    traefik.enable: "true"
    traefik.frontend.rule: "Host:{{ some-project.hostname }}"
    traefik.docker.network: "some_network_name"
    traefik.port: 80
    traefik.protocol: "http"
    traefik.frontend.redirect.entryPoint: "https"
  environment:
    DB_HOST: "mysql"
    DB_PORT: 3306
    DB_USERNAME: "{{mysql.user}}"
    DB_PASSWORD: "{{mysql.password}}"
    DB_DATABASE: "wfa_some-project"
    MAIL_DRIVER: smtp
    MAIL_HOST: "{{mail.host}}"
    MAIL_PORT: "{{mail.ssl_port}}"
    MAIL_USERNAME: "{{mail.username}}"
    MAIL_PASSWORD: "{{mail.password}}"
    MAIL_ENCRYPTION: "ssl"
    MAIL_FROM_ADDRESS: "{{mail.from_address}}"
    MAIL_FROM_NAME: "{{mail.from_name}}"
    APP_URL: "https://{{ some-project.hostname }}"
    APP_ENV: "{{some-project.APP_ENV}}"
    APP_DEBUG: "{{some-project.APP_DEBUG}}"
    APP_KEY: "{{some-project.APP_KEY}}"
    APP_SECURE: "1"
networks:
default:
  external:
    name: "some_network_name"

```
