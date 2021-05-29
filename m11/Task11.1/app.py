from flask import Flask, render_template
import random

app = Flask(__name__)

# list of cat images
images = [
    "https://i.giphy.com/media/mlvseq9yvZhba/giphy.webp",
    "https://media3.giphy.com/media/13CoXDiaCcCoyk/giphy.gif?cid=790b76116d0cf45f2c323437bc1df9e70ec4ec595025af2e&rid=giphy.gif&ct=g",
    "https://media2.giphy.com/media/C9x8gX02SnMIoAClXa/giphy.gif?cid=790b76113c707444c5c4ceb7d3262b5999ef0bc8ad925c17&rid=giphy.gif&ct=g",
    "https://media1.giphy.com/media/q1MeAPDDMb43K/giphy.gif?cid=ecf05e47u8k4azw3mcdb3g12rgno18qaecleqw2qmkb4lrw9&rid=giphy.gif&ct=g"
]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")
