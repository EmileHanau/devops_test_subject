FROM python:3.8.3

# set working directory
WORKDIR /app

# copy content of api src directory into /app
ADD ./flask/sentiment-clf /app

# install dependencies
RUN pip3 install -r requirements.txt

## have an interactiv command prompt
CMD ["./entry.sh"]
