# azure-pipelines-work
Notes, scripts, etc. for working with azure pipelines. Mostly for building Apache Flink on AZP.

## Bootstrap a new build worker

```
yum -y install htop yum-utils wget
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce
systemctl enable docker.service
systemctl start docker.service

yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
yum -y install  git2u-all

git clone https://github.com/rmetzger/azure-pipelines-work.git
```


