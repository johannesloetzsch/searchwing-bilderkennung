import cv2
import numpy as np
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
import os,glob

bc = cv2.CascadeClassifier()
clname = './classifier/cascade.xml'
if not bc.load(clname):
    print ("Error: Could not find classifier: " + clname)
    exit()

for file in glob.glob('./validation/*.jpg'):
    print(file)

    img = cv2.imread(file)

    e1 = cv2.getTickCount()
    boats = bc.detectMultiScale(img)
    e2 = cv2.getTickCount()
    print ((e2-e1)/cv2.getTickFrequency())

    for (x,y,w,h) in boats:
        cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)

    plt.imshow(cv2.cvtColor(img,cv2.COLOR_BGR2RGB))
    plt.show()




