#!/usr/bin/env bash

# mysql -uroot -proot123 -e 'CREATE DATABASE IF NOT EXISTS `symfony` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;'
# mysql -uroot -proot123 --init-command="SET SESSION FOREIGN_KEY_CHECKS=0;" symfony < docker-entrypoint-initdb.d/files/symfony.sql