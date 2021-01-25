FROM kammin/copilot-drupal as src

FROM nginx:1.19.6

COPY --from=hairyhenderson/gomplate:v3.8.0-slim /gomplate /bin/gomplate

COPY docker-images/nginx/assets/ /assets

COPY --from=src /var/www/html/web /var/www/html/web

ENTRYPOINT ["/bin/bash","/assets/bin/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]