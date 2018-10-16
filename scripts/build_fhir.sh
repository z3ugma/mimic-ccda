# !/bin/bash
DBNAME='fhir'
DBUSER='root'
DBPASS='fhir'


MIMIC_DATA="${PWD}/mimic/data"
MIMIC_SCHEMA="${PWD}/mimic/build-mimic"
MIMIC_DOCKER="${PWD}/mimic/docker"
MIMIC_DB_DIR="${PWD}/mimic/mariadb"
FHIR_DATA="${PWD}/fhir/data"
FHIR_SCHEMA="${PWD}/fhir/build-fhir"

# create fhir db store
FHIR_DB_DIR="${PWD}/fhir/mariadb"
if [ ! -d "$FHIR_DB_DIR" ]; then
  mkdir "$FHIR_DB_DIR"
fi

# create mimic db store
if [ ! -d "$MIMIC_DB_DIR" ]; then
  mkdir "$MIMIC_DB_DIR"
fi


if [ ! "$( docker images -q postgres/mimic )" ]; then
    echo "No such container"
    # build docker image
    cd "$MIMIC_DOCKER"
    docker build -t postgres/mimic .
fi

if [ ! "$(docker ps -q -f name=fhir)" ]; then

    if [ "$(docker ps -aq -f status=exited -f name=fhir)" ]; then
        # cleanup
        docker rm fhir
    fi
    # run your container
    docker run \
    --name fhir \
    -e MYSQL_ROOT_PASSWORD=fhir \
    -v $FHIR_SCHEMA:/fhir_schema \
    -v $FHIR_DATA:/fhir_data \
    -v $FHIR_DB_DIR:/var/lib/mysql/ \
    -d mariadb
fi

if [ ! "$(docker ps -q -f name=mimic)" ]; then
    # this part is copied from mimic-code repository.
    # https://github.com/MIT-LCP/mimic-code/blob/master/buildmimic/docker/unzip_csv.sh

    # echo 'Unzipping MIMIC data files in directory '  $MIMIC_DATA ' ...' 
    # for f in $MIMIC_DATA/*.gz; do 
    #     echo 'Unzipping ' $f ' ...';
    #     gunzip $f; 
    # done
    # chmod -R 0755 $MIMIC_DATA
    # echo 'Done!'

    if [ "$(docker ps -aq -f status=exited -f name=mimic)" ]; then
        # cleanup
        docker rm mimic
    fi
    # run your container
    docker run --name mimic \
    -p 5555:5432 \
    -e BUILD_MIMIC=1 \
    -e POSTGRES_PASSWORD=mimic \
    -e MIMIC_PASSWORD=mimic \
    -v $MIMIC_DATA:/mimic_data \
    -v $MIMIC_DB_DIR:/var/lib/postgresql/data \
    -d postgres/mimic
fi

DOCKER_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $DBNAME)
cat $FHIR_SCHEMA/*.sql | mysql -u $DBUSER -p$DBPASS -h $DOCKER_IP
# cat $MIMIC_SCHEMA/*.sql | mysql -u $DBUSER -p$DBPASS -h $DOCKER_IP
