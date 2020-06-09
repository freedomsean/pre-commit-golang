#!/usr/bin/env bash
coverageDir="$@"

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    echo "default directory will be shippable/codecoverage/"
    exit 1
fi

exec ([ -f $coverageDir] && mkdir -p $coverageDir) && ginkgo -r -cover -covermode=set -outputdir=$coverageDir/ -coverprofile=coverage.out && gocov convert $coverageDir/coverage.out | gocov-xml  > $coverageDir/coverage.xml