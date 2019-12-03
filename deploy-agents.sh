#!/bin/sh

if [[ -z "${AZURE_PAT}" ]]; then
	echo "Env variable AZURE_PAT not set"
	exit 1;
fi

if [[ -z "${AZURE_SERVER}" ]]; then
	echo "Env variable AZURE_SERVER not set"
	exit 1;
fi

if [[ -z "${NUM_AGENTS}" ]]; then
	echo "Env variable NUM_AGENTS not set"
	exit 1;
fi

for i in `seq 1 $NUM_AGENTS`
do
   echo "Deploying agent1"
done