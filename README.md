# devops_test_subject

## requirements
Docker

## setup (advanced usage)
1) to setup the docker container run: `docker build -t sentiment_api .`
2) to train the model using the data in `flask/sentiment-clf/lib/data/train.tsv` run: `docker run -it -p 5000:5000 sentiment_api python3 app.py --host=0.0.0.0`
3) to start the api and make it available to host run: `docker run -it sentiment_api python3 app.py --host=0.0.0.0`

## setup (easy usage)
1) go into the Dockerfile and uncomment line 14 (beginning with `ENTRYPOINT...`). this will create an entrypoint.
2) to start the docker container run: `docker run -it -p 5000:5000 sentiment_api`
4) you may want to train the model before trying to use it
- if you want to create a start script:
    - on Windows: `echo "docker run -it -p 5000:5000 sentiment_api" >> start.bat`
    - on Linux: `echo "docker run -it -p 5000:5000 sentiment_api" > start && sudo chmod +x start`

## testing the api
- on your local machine use your browser and go to http://localhost:5000/?query=the+movie+is+good
- or technically just send a GET request with: `query="the movie is good"`
