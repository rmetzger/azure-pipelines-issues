# azure-pipelines-work
Notes, scripts, etc. for working with azure pipelines. Mostly for building Apache Flink on AZP.

## Bootstrap a new build worker

```
yum install git htop yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce
sudo systemctl enable docker.service
sudo systemctl start docker.service
git clone https://github.com/rmetzger/azure-pipelines-work.git
```


