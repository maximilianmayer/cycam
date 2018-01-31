#!/usr/bin/env puma

environment 'production'
daemonize false
quiet false
bind 'tcp://0.0.0.0:4567'
rackup 'config.ru'
