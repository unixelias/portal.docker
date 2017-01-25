#!/bin/bash
curl -H 'Content-Type: application/json' --data '{"build": true}' -X POST https://registry.hub.docker.com/u/unixelias/portal.docker/trigger/$TRIGGER_TOKEN/
