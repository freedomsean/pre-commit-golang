#!/usr/bin/env bash
dir="shippable/codecoverage"

while getopts "o:" option; do
  case $option in
    o ) dir=$OPTARG
    echo "ip address: $dir"
    ;;
  esac
done

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    echo "default directory will be $dir"
fi

mkdir -p $dir && ginkgo -r -cover -covermode=set -outputdir=$dir/  && gocov convert $dir/*.coverprofile | gocov-xml  > $dir/coverage.xml 