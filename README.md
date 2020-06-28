# devops_test_subject

## requirements
Docker

## Linux

### setup (easy usage)
1) run: `./quick_setup.sh`
#### OR
1) go into the Dockerfile and uncomment the last line (beginning with `ENTRYPOINT...`). this will create an entrypoint.
2) to setup the docker container run: `docker build -t sentiment_api .`
2) to start the docker container run: `docker run -it -v $PWD/flask/lib:/app/lib -p 5000:5000 sentiment_api`
4) you may want to train the model before trying to use it (training data is stored in `flask/lib/data/train.tsv`)
- if you want to create a start script: `echo "docker run -it -v $PWD/flask/lib:/app/lib -p 5000:5000 sentiment_api" > start && chmod +x start`

### setup (advanced usage)
1) to setup the docker container run: `docker build -t sentiment_api .`
2) to train the model using the data in `flask/lib/data/train.tsv` run: `docker run -it -v $PWD/flask/lib:/app/lib sentiment_api python3 build_model.py`
3) to start the api and make it available to host run: `docker run -it -v $PWD/flask/lib:/app/lib -p 5000:5000 sentiment_api python3 app.py --host=0.0.0.0`

## Windows TODO: get a Windows machine and confirm the tutorial works

### setup (easy usage)
1) go into the Dockerfile and uncomment the last line (beginning with `ENTRYPOINT...`). this will create an entrypoint.
2) to setup the docker container run: `docker build -t sentiment_api .`
2) to start the docker container run: `docker run -it -v %cd%/flask/lib:/app/lib -p 5000:5000 sentiment_api`
4) you may want to train the model before trying to use it (training data is stored in `flask/lib/data/train.tsv`)
- if you want to create a start script: `echo "docker run -it -v %cd%/flask/lib:/app/lib -p 5000:5000 sentiment_api" > start && chmod +x start`

### setup (advanced usage)
1) to setup the docker container run: `docker build -t sentiment_api .`
2) to train the model using the data in `flask/lib/data/train.tsv` run: `docker run -it -v %cd%/flask/lib:/app/lib sentiment_api python3 build_model.py`
3) to start the api and make it available to host run: `docker run -it -v %cd%/flask/lib:/app/lib -p 5000:5000 sentiment_api python3 app.py --host=0.0.0.0`

## testing the api
- on your local machine use your browser and go to http://localhost:5000/?query=the+movie+is+good
