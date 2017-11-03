%%Status working
%Program to read single image 
%Program for final segmentation of nuclei ..Proposed Technique
%The technique used to segment the nuclei from the Pap smear images, it is
%using the vlfeat toolbox. Before running the program please install vlfeat
%toolbox
%Written by Kangkana Bora, kangkana.bora89@gmail.com

%Steps -> 1:Wavelet 2: K_Mean 3: MSER 4:Shape feature extraction
%linked programs -> Wavelet_basic ->mser -> KMean -> round_circle
tic;
clear all; close all;
Input_Image=imread('C:\Users\IASST1\Documents\MATLAB\Image_Database\Ground Truth\Actual\HSIL\196.jpg');
%Input_Image=imread('biopsy.jpg');
%K = imresize(I,[1024 768]);
%Red Component of Colour Image
Red=Input_Image(:,:,1);
%Green Component of Colour Image
Green=Input_Image(:,:,2);
%Blue Component of Colour Image
Blue=Input_Image(:,:,3);



%Apply Two Dimensional Discrete Wavelet Transform
[LLr,LHr,HLr,HHr]=dwt2(Red,'haar');
[LLg,LHg,HLg,HHg]=dwt2(Green,'haar');
[LLb,LHb,HLb,HHb]=dwt2(Blue,'haar');

display('Please wait for some time...Donot touch any key..Programm is running');

First_Level_Decomposition(:,:,1)=[LLr];
First_Level_Decomposition(:,:,2)=[LLg];
First_Level_Decomposition(:,:,3)=[LLb];

First_Level_Decomposition=uint8(First_Level_Decomposition);
%imwrite(First_Level_Decomposition,'C:\Users\IASST1\Documents\MATLAB\CODING\segment_final\wavelet.jpg');
f = First_Level_Decomposition;
f2 = imcrop(f,[0 0 1024 768]);
figure,imshow(f2);
mser(f2, Input_Image);
bps(Input_Image);
str = 'Program Sucessfully completed';
display(str);
output=delete_obj();
figure,imshow(output),title('Final Output');
imwrite(output,'final_output.jpg');
toc;
%plissiti_watershed(f2);