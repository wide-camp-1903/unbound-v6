#!/bin/bash
set -e
[[ $DEBUG == "true" ]] && set -x

UNBOUND_CONF="/etc/unbound/unbound.conf"

unbound-checkconf $UNBOUND_CONF || exit 0

case $1 in
    'unbound')
        unbound -c $UNBOUND_CONF ;;
esac
