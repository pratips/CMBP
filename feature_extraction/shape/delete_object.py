'''
Created on Nov 1, 2017

@author: pratip.samanta
'''

import os 
import cv2
from cv2 import imread
import sys
import numpy as np

def delete_obj(response_path):
    img = cv2.imread(response_path) 
    ret2,th2 = cv2.threshold(img,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
    
if __name__ == '__main__':
    pass