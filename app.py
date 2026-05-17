from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():

    return """
    <h1>Secure DevSecOps Pipeline</h1>

    <p>Application Status : Running</p>

    <p>Environment : dev</p>

    <p>Cloud Provider : AWS</p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)

