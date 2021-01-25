FROM drupal:9.0-fpm-alpine

COPY --from=hairyhenderson/gomplate:v3.8.0-slim /gomplate /bin/gomplate

RUN apk --update add --no-cache fcgi mysql-client bash

RUN curl -o /usr/local/bin/php-fpm-healthcheck https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck &&\
    chmod +x /usr/local/bin/php-fpm-healthcheck

COPY docker-images/drupal/conf/php-fpm-status.conf /usr/local/etc/php-fpm.d/status.conf

COPY docker-images/drupal/conf/php.ini /usr/local/etc/php/php.ini

COPY docker-images/drupal/conf/drush.yml /root/.drush/drush.yml
COPY docker-images/drupal/conf/alias.site.yml /root/.drush/sites/alias.site.yml

HEALTHCHECK --interval=5s --timeout=10s --start-period=5s --retries=3 CMD [ "php-fpm-healthcheck" ]

COPY docker-images/drupal/assets/ /assets

COPY src/ /var/www/html/

RUN composer install

RUN chown -R www-data:www-data web/sites/default

# Drush
RUN ln -s /var/www/html/vendor/drush/drush/drush /usr/local/bin/drush

EXPOSE 9000

ENTRYPOINT ["/bin/bash","/assets/bin/docker-entrypoint.sh"]
CMD ["php-fpm","--fpm-config","/usr/local/etc/php-fpm.conf","-c","/usr/local/etc/php/php.ini"]

