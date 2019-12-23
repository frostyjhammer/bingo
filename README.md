# bingo
buzzword bingo rails app

To start postgresql server:
/usr/pgsql-9.4/bin/pg_ctl start -D /var/lib/pgsql9.4/data -l /var/lib/pgsql/9.4/postgres.log

To start the rails server for the bingo application:
rails server -b 192.168.1.98 -p 8080
