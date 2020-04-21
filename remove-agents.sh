#!/bin/sh

set -x

if [[ -z "${AZURE_PAT}" ]]; then
	echo "Env variable AZURE_PAT not set"
	exit 1;
fi

if [[ -z "${FROM_ID}" ]]; then
	echo "Env variable FROM_ID not set"
	exit 1;
fi

if [[ -z "${TO_ID}" ]]; then
        echo "Env variable TO_ID not set"
        exit 1;
fi


for i in `seq $FROM_ID $TO_ID`
do
   echo "Stopping service of agent$i"
   cd /home/agent$i/myagent
   ./svc.sh stop
   AGENT_ALLOW_RUNASROOT=true
   ./svc.sh uninstall

   VSTS_AGENT_INPUT_AUTH=pat AGENT_ALLOW_RUNASROOT=true \
   VSTS_AGENT_INPUT_TOKEN=$AZURE_PAT \
   ./config.sh remove --unattended
   userdel --remove agent$i
done
