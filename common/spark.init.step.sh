cd ~/
IS_MASTER=false
if [ -f /mnt/var/lib/info/instance.json ]
then
	IS_MASTER=$(jq .isMaster /mnt/var/lib/info/instance.json)
fi
if $IS_MASTER; then
    ## only runs on master
  git clone https://github.com/saptarshiguha/mozillametricstools   
fi 

echo `ps -o user= -p $$ | awk '{print $1}'`
sudo -i pip install --upgrade pip
sudo -i pip install py4j --upgrade
sudo -i pip install feather-format
## Copy the ipython startup files

mkdir -p ~/.ipython/profile_default/startup/ && cp ~/mozillametricstools/01-mozmetrics-setup.py ~/.ipython/profile_default/startup/
