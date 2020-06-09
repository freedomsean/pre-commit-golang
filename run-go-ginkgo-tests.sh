#!/usr/bin/env bash
mkdir -p ./shippable/codecoverage

ginkgo -r -cover -covermode=set -outputdir=./shippable/codecoverage/ -coverprofile=coverage.out && gocov convert ./shippable/codecoverage/coverage.out | gocov-xml  > ./shippable/codecoverage/coverage.xml

returncode=$?
if [ $returncode -ne 0 ]; then
  echo "unit tests failed"
  exit 1
fi
