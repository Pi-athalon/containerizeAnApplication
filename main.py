import flask
import socket
import datetime

app = flask.Flask(__name__)


@app.route("/")
def hello_world():
    return f"This server is running on {socket.gethostname()} and it is {datetime.datetime.now().isoformat()}"