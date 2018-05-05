### Detecting boats on water

This is a set of images and tools to train the OpenCV Haar Cascade classifier
to classify an image as plain open sea with no objects on the water or water with
boats or other structures.

#### Files and directories

The negativesamples directory contains pictures with plain water and no boats or other
structures.

The positivesamples directory contains images with boats on water. The images are annotated with
rectangles around the boats. The annotation is data is stored in ./positivesamples/anno.dat and
./positivesamples/annotations.json

The validation directory contains images with boats for validation

### Prerequisites

Install python and opencv via https://conda.io

### Annotating images

The positivesamples directory contains images which contain boats. To identify the boats, the
images are annotated. The annotation can be done with the via.html file. Simply open via.html
with your webbrowser. The annotation tool is a modified version of the vgg image annotator tool
from Oxford University http://www.robots.ox.ac.uk/~vgg/software/via .  The source code of the
modified version is here: https://gitlab.com/fredowski/via . The annotation process is done
with the following steps:

- Open via.html in your browser
- Load all images from the positivesamples directory
- Load the annotations.json file
- Add rectangles - try to keep the rectangle square
- Save annotations as JSON to annotations.json
- Save annotations as DAT to anno.dat

No import is possible for DAT type, so make sure you have saved the JSON format...

### Run the example

##### Prepare data structures - Create boats.vec and bg.txt

OpenCV requires the positive samples in a .vec file. The following script will create the file
"boats.vec" with the positive samples and the file "bg.txt" with the list of files
which contain no boat from the negativsamples directory.

```
./init.sh
```

##### Verify the positive samples

To see if the positive samples are o.k, you can run

```
./verify.sh
```

This will open the boats.vec file and display the positive samples.

##### Train the classifier

The training is started with

```
./train.sh
```

The training takes about 1 hour on my MacBook. Afterwards the directory "classifier" contains the classifier data.

##### Validate the classifier

The validation is started with

```
python detect.py
```

This will open the images in the validation directory, run the detector, add rectangles around the detected objects and show the resulting image.

### ToDo

- The validation does only run the detection. There should be code which can read an annotation and compare the detection results vs. ground truth.
- The detection currently uses opencv detectMultiscale and it takes about 1.5 seconds on my MacBook. We do not need to identfy the location of the boats but just the if there is plain water or not. There should be room to make this faster.
- Annotation is not complete...
- The images from Bodensee are not included yet.
