# !/bin/bash

# build synthea according to https://github.com/synthetichealth/synthea
git clone https://github.com/synthetichealth/synthea.git
cd synthea

# change properties file to produce csv along with json
sed -i -e 's/exporter.csv.export = false/exporter.csv.export = true/g' synthea/src/main/resources/synthea.properties

# build
./gradlew build check test

# generate 1000 valid STU3 bundles in output/
./run_synthea Massachusetts -p 1000

mkdir -p ../fhir/data
mv output/csv/*.csv ../fhir/data/
