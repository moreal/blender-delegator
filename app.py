import function
from flask import Flask, request, Request

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def index():
    print('1', request.files)
    if request.method == "POST" and len(request.files) != 0:
        return function.render(request)
    else:
        return "<form action='/' method='POST' enctype='multipart/form-data'><input type='file' name='blender_file'><button>Submit</button></form>"

app.run(host='0.0.0.0', port='80')
