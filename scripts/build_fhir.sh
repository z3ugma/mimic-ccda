# !/bin/bash
DBNAME='fhir'
DBUSER='root'
DBPASS='fhir'


MIMIC_DATA="${PWD}/mimic/data"
MIMIC_SCHEMA="${PWD}/mimic/build-mimic"
FHIR_DATA="${PWD}/fhir/data"
FHIR_SCHEMA="${PWD}/fhir/build-fhir"

# create fhir db store
FHIR_DB_DIR="${PWD}/fhir/mariadb"
if [ ! -d "$FHIR_DB_DIR" ]; then
  mkdir "$FHIR_DB_DIR"
fi

if [ ! "$(docker ps -q -f name=fhir)" ]; then

    if [ "$(docker ps -aq -f status=exited -f name=fhir)" ]; then
        # cleanup
        docker rm fhir
    fi
    echo 'Create docker for fhir'
    # run your container
    docker run \
    --name fhir \
    -e MYSQL_ROOT_PASSWORD=fhir \
    -v $FHIR_SCHEMA:/fhir_schema \
    -v $FHIR_DATA:/fhir_data \
    -v $FHIR_DB_DIR:/var/lib/mysql/ \
    -v $MIMIC_DATA:/mimic_data \
    -v $MIMIC_SCHEMA:/mimic_schema \
    -d mariadb
fi

echo 'Unzipping MIMIC data files in directory '  $MIMIC_DATA ' ...' 
for f in $MIMIC_DATA/*.gz; do 
    echo 'Unzipping ' $f ' ...';
    gunzip $f; 
done
chmod -R 0755 $MIMIC_DATA
echo 'Done!'


DOCKER_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $DBNAME)
# cat $MIMIC_SCHEMA/*.sql | mysql -u $DBUSER -p$DBPASS -h $DOCKER_IP
cat $FHIR_SCHEMA/*.sql | mysql -u $DBUSER -p$DBPASS -h $DOCKER_IP
