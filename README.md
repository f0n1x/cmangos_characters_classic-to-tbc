How to leverage this:

* Create a dump of your cmangos-classic characters db. (i.e. mysqldump -u[username] -p[password] cmangos_characters-classic > classic-characters.sql)

* Create a tbc characters db. (i.e. [From mysql/mariadb] CREATE DATABASE cmangos_characters-tbc;)

* Import your old cmangos-classic chracters db to the new cmangos-tbc characters db. (i.e. mysql -u<username> -p<password> cmangos_characters-tbc < classic-characters.sql)

* Run the sql script from this repo against the db you want to convert. (i.e. mysql -u<username> -p<password> cmangos_characters-tbc < cmangos-characters-convert-classic-to-tbc.sql)
