FROM mariadb:lts-ubi9

# Variáveis de ambiente padrão (substitua no Railway)
ENV MARIADB_ROOT_PASSWORD=root_password_here
ENV MARIADB_DATABASE=meu_banco
ENV MARIADB_USER=usuario
ENV MARIADB_PASSWORD=senha_usuario

# Copia configuração customizada
COPY my.cnf /etc/mysql/conf.d/my.cnf

# Copia script de inicialização de backup
COPY init-backup.sh /docker-entrypoint-initdb.d/init-backup.sh
RUN chmod +x /docker-entrypoint-initdb.d/init-backup.sh

# Persistência de dados
VOLUME /var/lib/mysql

# Expor porta padrão
EXPOSE 3306

# Ajuste de memória dinamicamente (opcional, baseado na memória disponível)
# Este passo pode ser feito via entrypoint ou command override no Railway

# Comando padrão
CMD ["mysqld"]
