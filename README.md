# terraform-aws-spot-ec2-x86

Deploy Spot EC2 instance:
```bash
terraform init
terraform apply -auto-approve
```

Update your `/etc/netplan/50-cloud-init.yaml` file:
```yaml
network:
    ethernets:
        ens5:
            dhcp4: true
            dhcp6: false
            match:
                macaddress: 02:b1:38:70:da:63
            set-name: eth0
        ens6:
            addresses:
            - 172.31.20.108/20
            dhcp4: false
            dhcp6: false
            match:
                macaddress: 02:1b:81:42:ee:49
            set-name: eth1
    version: 2
```
