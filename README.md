# autoscale

TemplateForAutoscaling

# using AWS EC2 auto scaling group

###### For master node (optional or self-hosted)

* minimum spec 1 vCpu 1 Gb
* recommend spec 2 vCpu 4Gb
* **STRONG INTERNET CONNECTION most of the time player will facing a lag spike if the internet is not high enough.**

###### For worker node

- base 1 vCpu 512 mb for background processes
- minnimum spec 1 vCpu 1 Gb without plugin/mod
- recommended server type 1 vCpu 16 Gb with plugin/mod
- **this mean you need 2 vCpu 1.5 Gb at least for minimum and 2vCpu 16.5 Gb for recommend**

# Example setup guide for Autoscaling

## example requirements

- recommend spec can handle 10 players each node.
- no master node (using RainBowCreation Mainnet as master)
- direct connect or external load balancer (without proxy bungeecord, velocity... etc.)

## Create security Groups

- for autoscale group set inbound port 25565 TCP
- create new node if cpu utilization > 50%

## create new Lunch Templates

- use t2.medium as Instance type
- put Lunch_templates-User-Data scipt inside User data for auto setup

## create Auto Scaling groups

- using t2.medium as Instance type
- setup Dynamic scaling policies to Target Tracking Policy As required to maintain Average CPU utilization at 50
- make sure your first desire node = minimum node there may cause was some wird bug when first setup is not equal.
- enjoy :)

for manually installation run setup.sh
