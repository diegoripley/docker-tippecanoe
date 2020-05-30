#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

fly_target=tippecanoe

pushd $DIR
    fly -t ci set-pipeline -c pipeline.yml -p ${fly_target} --load-vars-from credentials.yml
    fly -t ci unpause-pipeline -p ${fly_target}
popd
