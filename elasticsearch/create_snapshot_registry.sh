#!/bin/bash
set -e
if [ -z ${ES_HOST} ]; then
  echo "Please set env variable ES_HOST"
  exit 1
fi
if [ -z ${REPOSITORY_NAME} ]; then
  echo "Please set env variable REPOSITORY_NAME"
  exit 1
fi
if [ -z ${S3_BUCKET_NAME} ]; then
  echo "Please set env variable S3_BUCKET_NAME"
  exit 1
fi
if [ -z ${S3_BASE_PATH} ]; then
  echo "Please set env variable S3_BASE_PATH"
  exit 1
fi
curl -X PUT ${ES_HOST}/_snapshot/${REPOSITORY_NAME} -d '{ "type": "s3","settings": {"client": "default","bucket": "'${S3_BUCKET_NAME}'","region": "us-west-2", "base_path":"'${S3_BASE_PATH}'" }}' -H 'Content-Type: application/json'
