#!/bin/bash

### uncomment following line to enable rebuild of container on startup
# ./install.sh

docker run -p 5000:5000 sentiment_api
