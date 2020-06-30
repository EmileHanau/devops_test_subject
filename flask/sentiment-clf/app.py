from flask import Flask
from flask_restful import reqparse, abort, Api, Resource
import pickle
import numpy as np
from model import NLPModel

app = Flask(__name__)
api = Api(app)

model = NLPModel()

clf_path = 'lib/models/SentimentClassifier.pkl'
# catch exception, if modal was not trained beforehand. (lib/models/SentimentClassifier.pkl would be missing)
try:
    with open(clf_path, 'rb') as f:
        model.clf = pickle.load(f)
except:
    print("No SentimentClassifier found. You may want to train the ai first.")
    exit()

# catch exception, if modal was not trained beforehand. (lib/models/TFIDFVectorizer.pkl would be missing)
vec_path = 'lib/models/TFIDFVectorizer.pkl'
try:
    with open(vec_path, 'rb') as f:
        model.vectorizer = pickle.load(f)
except:
    print("No TFIDFVectorizer found. You may want to train the ai first.")
    exit()
# argument parsing
parser = reqparse.RequestParser()
parser.add_argument('query')


class PredictSentiment(Resource):
    def get(self):
        # use parser and find the user's query
        args = parser.parse_args()
        user_query = args['query']

        # vectorize the user's query and make a prediction
        uq_vectorized = model.vectorizer_transform(np.array([user_query]))
        prediction = model.predict(uq_vectorized)
        pred_proba = model.predict_proba(uq_vectorized)

        # Output either 'Negative' or 'Positive' along with the score
        if prediction == 0:
            pred_text = 'Negative'
        else:
            pred_text = 'Positive'

        # round the predict proba value and set to new variable
        confidence = round(pred_proba[0], 3)

        # create JSON object
        output = {'prediction': pred_text, 'confidence': confidence}

        return output


# Setup the Api resource routing here
# Route the URL to the resource
api.add_resource(PredictSentiment, '/')


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
