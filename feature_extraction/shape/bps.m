function bps(F)


%F=imread('C:\Users\IASST1\Documents\MATLAB\Image_Database\Organized\Pap smear image Database\CIN I\CIN I 1 (3).jpg');   %read image
F = rgb2gray(F);
G1=bitget(F,1); % get bitplane 1
G2=bitget(F,2); % get bitplane 2
G3=bitget(F,3); % get bitplane 3
G4=bitget(F,4); % get bitplane 4
G5=bitget(F,5); % get bitplane 5
G6=bitget(F,6); % get bitplane 6
G7=bitget(F,7); % get bitplane 7
G8=bitget(F,8); % get bitplane 8


%subplot(4,4,[1 8]);imshow(F);title('Original 8 bit image');  %subplot original Image
%subplot(4,4,9);imshow(logical(G1));title('Bitplane 1');      %Show Bitplane 1 
%subplot(4,4,10);imshow(logical(G2));title('Bitplane 2');     %Show Bitplane 2
%subplot(4,4,11);imshow(logical(G3));title('Bitplane 3');     %Show Bitplane 3
%subplot(4,4,12);imshow(logical(G4));title('Bitplane 4');     %Show Bitplane 4
%subplot(4,4,13);imshow(logical(G5));title('Bitplane 5');     %Show Bitplane 5
%subplot(4,4,14);imshow(logical(G6));title('Bitplane 6');     %Show Bitplane 6
%subplot(4,4,15);imshow(logical(G7));title('Bitplane 7');     %Show Bitplane 7
%subplot(4,4,16);imshow(logical(G8));title('Bitplane 8');     %Show Bitplane 8

I = logical(G8);
I1 = imcomplement(I);
%figure,imshow(I);
se=strel('square',3);
%fo=imopen(M,se);
erode = imerode(I1,se);
dilate = imdilate(erode, se);
final = bwareaopen(dilate,2000,8);
final = imfill(final,'holes');
figure,imshow(final),title('Final cytoplasm Segmentation');

B = imresize(final,0.5);
%figure,imshow(B);
imwrite(B,'resize.jpg');
remove_debris();

return