# Use The Python3.7.2 container image
FROM python:3.8.3

# set working directory
WORKDIR /app

# copy content of api src directory into /app
ADD ./flask/sentiment-clf /app

# install dependencies
RUN pip3 install -r requirements.txt

## uncomment following line to have an interactiv command prompt (easy setup)
# ENTRYPOINT ["./entry.sh"]
