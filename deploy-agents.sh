#!/bin/sh

set -x

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

if [[ -z "${NAME}" ]]; then
        echo "Env variable NAME not set"
        exit 1;
fi

for i in `seq 1 $NUM_AGENTS`
do
   echo "Creating user agent$i"
   useradd agent$i
   sudo usermod -aG docker agent$i
   cd /home/agent$i
   mkdir myagent && cd myagent

   echo "Downloading agent tool"
   wget https://vstsagentpackage.azureedge.net/agent/2.160.1/vsts-agent-linux-x64-2.160.1.tar.gz
   tar xf vsts-agent-linux-x64-2.160.1.tar.gz
 
   chown -R agent$i /home/agent$i

   echo "setup the agent"
   ./bin/installdependencies.sh
   sudo -u agent$i VSTS_AGENT_INPUT_URL=$AZURE_SERVER \
   VSTS_AGENT_INPUT_AUTH=pat \
   VSTS_AGENT_INPUT_TOKEN=$AZURE_PAT \
   VSTS_AGENT_INPUT_POOL=Default \
   VSTS_AGENT_INPUT_AGENT=$NAME-agent$i \
   ./config.sh --unattended
   ./svc.sh install
done
