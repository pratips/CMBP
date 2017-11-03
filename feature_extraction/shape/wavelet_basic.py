'''
Created on Oct 31, 2017

@author: pratip.samanta
'''
import os 
import cv2
import sys
import numpy as np
import pywt

class Wavelet(object):
    '''
    classdocs
    '''


    def __init__(self):
        '''
        Constructor
        '''
        pass
    
    def main_process(self, response_path):
        img = cv2.imread(response_path) 
        red = img[:, :, 0]
        green = img[:, :, 1]
        blue = img[:, :, 2]
        coeffs = pywt.dwt2(red, 'haar')
        cAr, (cHr, cVr, cDr) = coeffs
        coeffs = pywt.dwt2(green, 'haar')
        cAg, (cHg, cVg, cDg) = coeffs
        coeffs = pywt.dwt2(blue, 'haar')
        cAb, (cHb, cVb, cDb) = coeffs
        print cAr.shape
        print cAg.shape
        print cAb.shape
        First_Level_Decomposition = np.zeros((153,127,3))
        First_Level_Decomposition[:,:,0]=cAr;
        First_Level_Decomposition[:,:,1]=cAg;
        First_Level_Decomposition[:,:,2]=cAb;
        First_Level_Decomposition = cv2.convertScaleAbs(First_Level_Decomposition)
        cv2.imshow("window", First_Level_Decomposition)
        cv2.waitKey()
        f2 = First_Level_Decomposition[0:76,0:102]
        cv2.imshow("window", f2)
        cv2.waitKey()
        
        
    def w2d(self, img, mode='haar', level=1):
        imArray = cv2.imread(img)
        #Datatype conversions
        #convert to grayscale
        imArray = cv2.cvtColor( imArray,cv2.COLOR_RGB2GRAY )
        #convert to float
        imArray =  np.float32(imArray)   
        imArray /= 255;
        # compute coefficients 
        coeffs=pywt.wavedec2(imArray, mode, level=level)
    
        #Process Coefficients
        coeffs_H=list(coeffs)  
        coeffs_H[0] *= 0;  
    
        # reconstruction
        imArray_H=pywt.waverec2(coeffs_H, mode);
        imArray_H *= 255;
        imArray_H =  np.uint8(imArray_H)
        #Display result
        cv2.imshow('image',imArray_H)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

wavelet = Wavelet()
print os.getcwd()
wavelet.main_process("../../NILM/1.jpg")
# wavelet.w2d("../../NILM/1.jpg", "haar")
