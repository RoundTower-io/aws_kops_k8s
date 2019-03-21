#!/usr/bin/env bash

KOPS_STATE_STORE=""
KOPS_DNS_ZONE=""
KOPS_CLUSTER_NAME="tennisk8s"

function help_menu () {
cat << EOF
Usage: ${0}

OPTIONS:
   -h|--help             Show this message

   -d|--dns-zone         Kops DNS zone

   -s|--state-store      Kops state storage location


EXAMPLES:
   cleanup_k8s.sh --dns-zone "gamename.me" --state-store "s3://gamename-kubernetes"

EOF
exit
}

# Deal with command line flags.
while [[ $# > 0 ]]
do
case "${1}" in
  -cn|--cluster-name)
  KOPS_CLUSTER_NAME="${2}"
  shift
  ;;
  -d|--dns-zone)
  KOPS_DNS_ZONE="${2}"
  shift
  ;;
  -h|--help)
  help_menu
  shift
  ;;
  -s|--state-store)
  KOPS_STATE_STORE="${2}"
  shift
  ;;
  *)
  echo "${1} is not a valid flag, try running: ${0} --help"
  ;;
esac
shift
done

[ -z ${KOPS_DNS_ZONE} ] && echo "DNS Zone required!" && help_menu
[ -z ${KOPS_STATE_STORE} ] && echo "Kops state store required!" && help_menu

kops delete cluster ${KOPS_CLUSTER_NAME}.${KOPS_DNS_ZONE} --state=$KOPS_STATE_STORE --yes;

