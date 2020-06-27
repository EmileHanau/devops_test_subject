# Use The Python3.7.2 container image
FROM python:3.8.3

# set working directory
WORKDIR /app

# copy content of api src directory into /app
ADD ./flask/sentiment-clf /app

# install dependencies
RUN pip3 install -r requirements.txt

# run api on startup
CMD ["python3", "build_model.py"]
ENTRYPOINT ["python3", "app.py", "--host=0.0.0.0"]

EXPOSE 5000
