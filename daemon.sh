#!/bin/bash

cd $(dirname $0)
DIR=$(pwd)
while true;do
    php $DIR/monitoring_data_collector.php
done
