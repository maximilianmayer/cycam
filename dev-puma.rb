#!/usr/bin/env puma

environment 'development'
daemonize false
quiet false
bind 'tcp://localhost:4567'
rackup 'config.ru'
