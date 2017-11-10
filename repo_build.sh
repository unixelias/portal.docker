#!/bin/bash
curl -H 'Content-Type: application/json' --data '{"build": true}' -X POST https://registry.hub.docker.com/u/unixelias/plone.idg/trigger/$TRIGGER_TOKEN/
curl -X POST https://hooks.microbadger.com/images/unixelias/plone.idg/UqI2jjYcxbC3LKRwYp90UHNiNZE=
