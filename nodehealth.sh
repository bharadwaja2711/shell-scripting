#!/bin/bash

#####################################################
# Author: Manoj                                     #
# Date: 18/08/2024                                  #
#                                                   #
# Purpose: To determine the node health of a system #
# Version: v1                                       #
#####################################################

set -x  # debug mode

set -e

set -o pipefail

df -h

free -g

nproc

ps -ef | grep "snapfuse" | awk -F" " '{print $2}'
