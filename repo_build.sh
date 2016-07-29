#!/bin/bash
curl -H 'Content-Type: application/json' --data '{"build": true}' -X POST https://registry.hub.docker.com/u/caduvieira/plonegovbridg/trigger/$TRIGGER_TOKEN/
