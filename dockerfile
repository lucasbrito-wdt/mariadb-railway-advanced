FROM mariadb:lts-ubi9

# Variáveis de ambiente padrão (substitua no Railway)
ENV MARIADB_ROOT_PASSWORD=root_password_here
ENV MARIADB_DATABASE=meu_banco
ENV MARIADB_USER=usuario
ENV MARIADB_PASSWORD=senha_usuario

# Copia arquivos
COPY my.cnf.template /etc/mysql/conf.d/my.cnf.template
COPY init.sh /docker-entrypoint-initdb.d/init.sh
RUN chmod +x /docker-entrypoint-initdb.d/init.sh

# Persistência de dados
VOLUME /var/lib/mysql

# Porta padrão
EXPOSE 3306

CMD ["mysqld"]
