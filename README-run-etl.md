# Running the ETL on PostgreSQL

install postgres

```
$ sudo apt-get update
$ sudo apt-get install postgresql postgresql-contrib
```

run mimic postgres on docker

```
$ docker run \
--name mimic \
-p 5555:5432 \
-e BUILD_MIMIC=1 \
-e POSTGRES_PASSWORD=mimic \
-e MIMIC_PASSWORD=mimic \
-v /home/hcinyoung/data/mimic/data:/mimic_data \
-v /home/hcinyoung/data/mimic/docker:/var/lib/postgresql/data \
-d postgres/mimic
```

create sequence

```
$ psql -p 5555 -h 172.17.0.1 -U postgres -d mimic -f mimic/build-mimic/postgres_create_mimic_id.sql
```
