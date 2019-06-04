#!/bin/sh
PATH=/usr/local/bin:$PATH
python /home/app_user/pg_manager/src/manage.py collectstatic --noinput
python /home/codaxtr_user/codaxtr-extractor/src/codaxtr_site/manage.py syncdb --noinput --database al_auth
# Create superuser if initial setup
python /home/codaxtr_user/codaxtr-extractor/src/codaxtr_site/manage.py shell <<END
from django.contrib.auth.models import User
User.objects.filter(username="admin").exists() or User.objects.create_superuser("admin", "admin@example.com", "admin")
END

exec $@