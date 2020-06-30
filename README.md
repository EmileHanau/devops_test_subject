# devops_test_subject

## requirements
Docker

### setup
1) run: `./quick_setup.sh`
2) run `./start`
3) select option to train the model (training data is stored in `flask/lib/data/train.tsv`)
4) done
#### OR
1) to setup the docker container run: `docker build -t sentiment_api .`
2) to train the model using the data in `flask/lib/data/train.tsv` run: `docker run -v $PWD/flask/lib:/app/lib sentiment_api python3 build_model.py`
3) to start the api and make it available to host run: `docker run -v $PWD/flask/lib:/app/lib -p 5000:5000 sentiment_api python3 app.py --host=0.0.0.0`

- if you want to create a start script: `echo "docker run -v $PWD/flask/lib:/app/lib -p 5000:5000 sentiment_api python3 app.py --host=0.0.0.0" > start && chmod +x start`

## testing the api
- on your local machine use your browser and go to http://localhost:5000/?query=the+movie+is+good
