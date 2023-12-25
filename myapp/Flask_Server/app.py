from flask import Flask, request, jsonify
from flask_cors import CORS
from ultralytics import YOLO
import os

app = Flask(__name__)
CORS(app)

model_path = "./assets/model.pt"
model = YOLO(model_path)

UPLOAD_FOLDER = './uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

def get_unique_filename(original_filename, count):
    filenmae, extension = os.path.splitext(original_filename)
    new_filename = f"Image_{count}{extension}"
    return new_filename

# Define count outside the function to maintain state
count = 0

def save_uploaded_image(file):
    global count
    if file and allowed_file(file.filename):
        # Save the uploaded image
        filename = os.path.join(app.config['UPLOAD_FOLDER'], get_unique_filename(file.filename, count))
        file.save(filename)
        # Increment count for the next uploaded image
        count += 1
        return filename
    else:
        raise ValueError('Invalid file type')

def perform_prediction(image_path):
    # Perform prediction on the uploaded image
    output = model(image_path)
    output_counting = output[0].verbose()
    abc = ''.join(i for i in output_counting if '0' <= i <= '9')
    return abc

@app.route("/upload", methods=['GET','POST'])
def upload():
    try:
        if 'image' not in request.files:
            return jsonify({'error': 'No image part'})

        file = request.files['image']

        if file.filename == '':
            return jsonify({'error': 'No selected image'})

        image_path = save_uploaded_image(file)
        return image_path
        return jsonify({'success': f'Image uploaded successfully: {image_path}'})

    except Exception as e:
        return jsonify({'error': f'An error occurred: {str(e)}'})

@app.route("/api", methods=['GET','POST'])
def api():
    result = perform_prediction("./uploads/Image_%d"%(count-1)+".jpg")

    json_response = {'query': result}
    return jsonify(json_response)


if __name__ == "__main__":
    app.run(host='192.168.1.128', port=8000, debug=True)
