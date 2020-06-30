#!/bin/bash

docker build -t sentiment_api .
echo "docker run -it -v $PWD/flask/lib:/app/lib -p 5000:5000 sentiment_api" > start && chmod +x start
echo ""
echo "done. you can start the container by running ./start"
