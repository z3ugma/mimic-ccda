#!/usr/bin/env python

import ndjson
import json
from pathlib import Path

schema_files = Path("fhir/definitions.json/fhir.schema.json/").glob("*.json")
schema_name_d = {schema.name.split('.')[0] : [] for schema in list(schema_files)}

synthetic_fhir = Path("synthea/output/fhir/").glob("*.json")
for p in list(synthetic_fhir):
    data = json.load(p.open())
    for r in data["entry"]:
        resource = r["resource"]
        resourceType = resource["resourceType"]
        if resourceType in schema_name_d:
            del resource["resourceType"]
            schema_name_d[resourceType].append(resource)
    
for resourceType in schema_name_d.keys():
    if len(schema_name_d[resourceType]) > 0:
        ndjson_file = Path("ndjson/%s.ndjson" % resourceType)
        with ndjson_file.open(mode="w") as fp:
            ndjson.dump(schema_name_d[resourceType], fp)

