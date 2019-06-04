#!/bin/sh
PATH=/usr/local/bin:$PATH
python /home/app_user/pg_manager/src/webapp/manage.py collectstatic --noinput
python /home/codaxtr_user/codaxtr-extractor/src/webapp/manage.py syncdb --noinput --database al_auth
# Create superuser if initial setup
python home/app_user/pg_manager/src/webapp/manage.py shell <<END
END
exec $@