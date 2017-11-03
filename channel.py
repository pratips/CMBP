'''
Created on Sep 11, 2017

@author: pratip.samanta
'''
import os 
import cv2
from cv2 import imread
import sys
import numpy as np

class Channel(object):
    '''
    classdocs
    '''


    def __init__(self, params):
        '''
        Constructor
        '''
        print params
        
    def main_process(self, response_path):
        filenames = os.walk(response_path).next()[2] 
        for filename in filenames:
            try:
                print "Processing file == ", filename
                img = imread(response_path + filename)
                print img.shape
                print type(img)
                red = img[:, :, 0]
                cv2.imshow("window", img)
                cv2.waitKey()
                cv2.imshow("window2", img[:, :, 0])
                cv2.waitKey()
                just_red = np.reshape(red, red.shape[0] * red.shape[1])
                print just_red.shape
                cv2.imwrite('red.jpg', just_red * 255)
                #green
                green = img[:, :, 1]
                just_green = np.reshape(green, green.shape[0] * green.shape[1])
                print just_red.shape
                cv2.imwrite('green.jpg', just_green)
                #blue
                blue = img[:, :, 2]
                just_blue = np.reshape(blue, blue.shape[0] * blue.shape[1])
                cv2.imwrite('blue.jpg', just_blue)
                
                '''CMY model '''
                img_normalised = cv2.normalize(img.astype('float'), None, 0.0, 1.0, cv2.NORM_MINMAX) # Convert to normalized floating point
                red = img_normalised[:, :, 0]
                green = img_normalised[:, :, 1]
                blue = img_normalised[:, :, 2]
                c = 1-red;
                m = 1-green;
                y = 1-blue;
                cv2.imshow("window", y)
                cv2.waitKey()
                just_c = np.reshape(c, c.shape[0] * c.shape[1])
                just_m = np.reshape(m, m.shape[0] * m.shape[1])
                just_y = np.reshape(y, y.shape[0] * y.shape[1])
                
                '''HSV model '''
                hsvimg = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
                h=hsvimg[:,:,0];
                s_r=hsvimg[:,:,1];
                v=hsvimg[:,:,2];
                cv2.imshow("window", h)
                cv2.waitKey()
                hue =  np.reshape(h, h.shape[0] * h.shape[1])
                satu = np.reshape(s_r, s_r.shape[0] * s_r.shape[1])
                valo = np.reshape(v, v.shape[0] * v.shape[1])
                sys.exit()
            except Exception as e:
                print e
    
    def exp(self):
        a = np.array([[1, 2, 3], [4, 5, 6]])
        print a.shape
        a = np.reshape(a, a.shape[0] * a.shape[1])
        print a.shape
        sys.exit()

ochannel = Channel("Object Created")
# ochannel.exp()
ochannel.main_process('NILM/')
