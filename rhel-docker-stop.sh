#!/usr/bin/env bash
# -------------------------------------------------------------------
#
# File:           rhel-docker-stop.sh
# Project:        docker-nexus-pro
# Purpose:        A shell script for Red Hat Enterprise Linux (RHEL)
#                 since docker-compose cannot be used in the RHEL
#                 environments. Usage: ./rhel-docker-stop.sh
#
# Created on:     21 Jan 2019
# Created by:     David Sanders
# Creator email:  dsanderscanada@gmail.com
#
# Image version:  n/a
#
# -------------------------------------------------------------------
# Modifed On   | Modified By                 | Release Notes
# -------------------------------------------------------------------
# 21 Jan 2019  | David Sanders               | First release.
# -------------------------------------------------------------------

source scripts/variables.sh
source scripts/functions.sh

source scripts/stop-socat.sh
source scripts/stop-traefik.sh
source scripts/stop-nexus.sh
