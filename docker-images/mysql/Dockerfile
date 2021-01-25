FROM mysql:5.7

HEALTHCHECK --interval=5s --timeout=10s --start-period=5s --retries=3 CMD [ "mysqladmin ping --user=$MYSQL_USER --password=$MYSQL_PASSWORD" ]