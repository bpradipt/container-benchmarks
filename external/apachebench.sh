#!/bin/bash
#This should be run from an external system

hname=${1}
HOST=${hname:-localhost}

ab -n100 http://${HOST}/wordpress/
