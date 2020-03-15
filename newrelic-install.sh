#!/bin/bash
set -e

echo "------------ Install NewRelic --------------"

#Create a configuration file and add your license key
echo "license_key: a647c8efc77b926c57f93f0553df2fff8a76NRALVKV" | sudo tee -a /etc/newrelic-infra.yml

#Enable New Relic’s GPG key
curl https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | sudo apt-key add -

#Create the agent’s apt repo using the command for your distribution version
printf "deb [arch=amd64] http://download.newrelic.com/infrastructure_agent/linux/apt bionic main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list

#Update your apt cache
sudo apt-get update

#Run the install script
sudo apt-get install newrelic-infra -y
