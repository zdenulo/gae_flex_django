#!/bin/bash

python manage.py migrate  # apply database migrations in project
python manage.py collectstatic <<< yes  # collect static files with automatic yes answer
gsutil -m rsync -r static gs://BUCKET_NAME  # upload/sync static files folder with GCS bucket

gcloud app deploy --verbosity=debug --promote <<< Y  # deploy application and automatically make it default / serving
