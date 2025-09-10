# autoscale

TemplateForAutoscaling

# using AWS EC2 auto scaling group

###### For master node (optional or self-hosted)

* minimum spec 1 vCpu 1 Gb
* recommend spec 2 vCpu 2Gb
* **STRONG INTERNET CONNECTION**

###### For worker node
- **minimum specs support 20 playes per worker node**
- minnimum spec 2 vCpu 4 Gb without plugin/mod
- **recommend specs support 50 players per worker node**
- recommended server type 2 vCpu 8 Gb with plugin/mod

###### Multiple node in 1 machine calculation
- ram usage same as above
- each worker node require 1.5 core of cpu

# Example setup guide for Autoscaling

## example requirements

- no master node (using RainBowCreation Mainnet as master)

## Create security Groups

- for autoscale group set inbound port ``25565`` & ``35353`` ``TCP``

## create new Lunch Templates

- use ``m7i-flex.large`` for recommend spec
- os linux based ``dnf`` ``yum`` ``apt``
- put ``Lunch_templates-User-Data`` scipt inside User data for auto setup or ``AMI`` if you have a preinstalled images

## create Auto Scaling groups

- checkout [CloudWatch|https://github.com/RainBowCreation/CloudWatch] for retrieved server data (automatic installed in this scripts)
- enjoy :)

for manually installation run ``lib/install.sh`` ``setup.sh``
configurations available at ``config.json`` or overrided at ``Lauch_templates-Users-Data``