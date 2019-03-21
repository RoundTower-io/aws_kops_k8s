# aws_kops_k8s
Some simple KOPS scripts to create and take down a k8s cluster 

## Prereqs
1. Install [Kops](https://github.com/kubernetes/kops)
2. Have a Route 53 domain (e.g. foo.io) defined


## Usage
```
$ ./build_k8s.sh 
DNS Zone required!
Usage: ./build_k8s.sh

OPTIONS:
   -h|--help             Show this message

   -d|--dns-zone         Kops DNS zone

   -s|--state-store      Kops state store s3 bucket

   -r|--region           Kops AWS region

   -cn|--cluster-name    Kops cluster name

   -mc|--master-count    Kops master count

   -nc|--node-count      Kops node (minion) count

   -ms|--master-size     Kops master size

   -ns|--node-size       Kops node size

EXAMPLES:
   build_k8s.sh --dns-zone "gamename.me" --state-store "s3://gamename-kubernetes"

   build_k8s.sh --master-size "t2.medium"

   build_k8s.sh --dns-zone roundtower.io --state-store s3://rtt-kops --region "us-east-2a"

   Note: Do not forget to add the *zone* letter to the region name (i.e. us-east-2*a*)


```
