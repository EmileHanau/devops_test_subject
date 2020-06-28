#!/bin/bash

head -n 15 Dockerfile >| Dockerfile_tmp
rm Dockerfile
mv Dockerfile_tmp Dockerfile
echo 'ENTRYPOINT ["./entry.sh"]' >> Dockerfile
docker build -t sentiment_api .
echo "docker run -it -v $PWD/flask/lib:/app/lib -p 5000:5000 sentiment_api" > start && chmod +x start
echo ""
echo "done. you can start the container by running ./start"
