#!/bin/bash
echo "CONSUL_ENV_DATACENTER: $CONSUL_ENV_DATACENTER"
echo Setting Up Environment Variables...
CONSUL_DOMAIN_URL="http://consul-$CONSUL_ENV_DATACENTER.smileco.cloud:8500/v1/kv/$DOMAIN"

# curl -s http://consul-qa1.smileco.cloud:8500/v1/kv/shipment-service/db/DBPORT?raw
dbhost=$(curl -s $CONSUL_DOMAIN_URL/db/DBHOST?raw)
dbport=$(curl -s $CONSUL_DOMAIN_URL/db/DBPORT?raw)
dbname=$(curl -s $CONSUL_DOMAIN_URL/db/DBNAME?raw)
dbuser=$(curl -s $CONSUL_DOMAIN_URL/db/DBUSER?raw)
dbpass=$(curl -s $CONSUL_DOMAIN_URL/db/DBPASS?raw)
export DBHOST=$dbhost
export DBPORT=$dbport
export DBNAME=$dbname
export DBUSER=$dbuser
export DBPASS=$dbpass

echo "ENVIRONMENT: $ENVIRONMENT"
echo "DOMAIN: $DOMAIN"
echo "DBHOST: $DBHOST"
bash -c "$*"
