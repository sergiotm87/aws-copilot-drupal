#!/bin/bash

set -e

# sync s3 static-files folder from backup
aws s3 sync s3://${S3_BUCKET_BACKUP}/s3fs-public/ s3://${S3_BUCKET}/s3fs-public/

# last modified file mysql folder
FILE=$(aws s3 ls ${S3_BUCKET_BACKUP}/mysql-backups --recursive | sort | tail -n 1 | awk '{print $4}')

# get mysql dump from s3
aws s3 cp s3://${S3_BUCKET_BACKUP}/${FILE} ./mysql_dump.sql

# import database using drush command and drupal database settings
drush @alias.local sql:query --file=${PWD}/mysql_dump.sql --file-delete --debug