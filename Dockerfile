### DO NOT CHANGE HERE ANYTHING, UNLESS YOU KNOW EXACTL WHAT YOU ARE DOING.
### after a changes in this file, the setup files will need to be changed too.
# Use The Python3.8.3 container image
FROM python:3.8.3

# set working directory
WORKDIR /app

# copy content of api src directory into /app
ADD ./flask/sentiment-clf /app

# install dependencies
RUN pip3 install -r requirements.txt

## have an interactiv command prompt
ENTRYPOINT ["./entry.sh"]
