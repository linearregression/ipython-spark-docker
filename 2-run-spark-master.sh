#!/bin/bash

# import functions
source variables_and_helpers.sh


# set docker image
__image=$__image_master


# get host DNS server (for internal resolution)
__dns=$(dns_detect)


# run container
echo "starting $__image..."
__container=$(docker run  -d \
                          --hostname="$__hostname" \
                          --dns=$__dns \
                            $__image)


# forward host ports to container
host_forward_multiple_ports_to_container $__container


# notify user
echo "Visit Spark master UI at http://$__hostname:8080"
