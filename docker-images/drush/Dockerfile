FROM kammin/copilot-drupal

RUN apk --update add --no-cache aws-cli

COPY assets/ /assets

CMD ["/assets/scripts/db_migrate.sh"]
