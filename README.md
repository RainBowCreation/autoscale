# autoscale
TemplateForAutoscaling

# using AWS EC2 auto scaling group
- base 1 vCpu 2 Gb
- minnimum spec 1 vCpu 2 Gb without plugin/mod
- recommended server type 1 vCpu 10 Gb with plugin/mod(single thread)
- **witch mean you need 2 vCpu 4 Gb at lease for minimum or your server will lag as hell**

# Example setup guide for Autoscaling
## example requirements
- using 2 vCpu and 4 Gb ram for 10 players each node. 1 instance each node
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
