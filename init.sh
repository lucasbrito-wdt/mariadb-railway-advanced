#!/bin/bash
set -e

# Ajuste dinâmico do innodb_buffer_pool_size
MEMORY_LIMIT=$(awk '/MemTotal/ {printf "%.0f", $2*0.6}' /proc/meminfo)
sed "s/{{BUFFER_POOL_SIZE}}/${MEMORY_LIMIT}K/" /etc/mysql/conf.d/my.cnf.template > /etc/mysql/conf.d/my.cnf

# Inicia MariaDB
exec mysqld
