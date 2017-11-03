% MSER Program
%Status - Working 3

function final = mser(I, original)

%pfx = fullfile(vl_root,'data','spots.jpg') ;
%I = imread('C:\Users\IASST1\Documents\MATLAB\CODING\segment_final\wavelet.jpg') ;
%image(I) ;
%cropi=imread('C:\Users\IASST1\Documents\MATLAB\Ayursundra\Feature Set For Phase 1\CIN III\class 4 (89).jpg');
%K = imresize(cropi,[1024 768]);
originalImage =  original;

I = rgb2gray(I);
figure,imshow(I);


%I2=im2double(I);
%J=1*log(1+I2);
%J2=2*log(1+I2);
%J3=5*log(1+I2);
%figure, imshow(J),title('log1');
%figure, imshow(J2),title('log2');
%figure, imshow(J3),title('log3');

%I = adapthisteq(I);
%##############
I = imadjust(I,[],[],0.7);

%I=imadjust(I,[.0,0.6],[]);

%################
h=fspecial('gaussian',[3,3],.5);
I=imfilter(I,h);

figure, imshow(I);
%I = adapthisteq(I);
%I = uint8(rgb2gray(I)) ;
[r,f] = vl_mser(I,'MinDiversity',0.9,...
                'MaxVariation',0.1,...
                'Delta',13) ;
f = vl_ertr(f) ;
vl_plotframe(f) ;
M = zeros(size(I)) ;
for x=r'
 s = vl_erfill(I,x) ;
 M(s) = M(s) + 1;
end
figure(2) ;
clf ; imagesc(I) ; hold on ; axis equal off; colormap gray ;
[c,h]=contour(M,(0:max(M(:)))+.5) ;
set(h,'color','g','linewidth',1) ;
%figure,imshow(M);
se=strel('square',3);
%fo=imopen(M,se);
erode = imerode(M,se);
dilate = imdilate(erode, se);
dilate = imdilate(erode, se);
final = bwareaopen(dilate,300,8);
final = imfill(final,'holes');

figure,imshow(final),title('Final Segmentation');
imwrite(final,'final.jpg');
%figure,imshow(label2rgb(final)),title('Output image showing only the nuclei');

I2 = final;
I2 = double(I2);
%round_circle(I2);
%[area1 per ecc com circularity]=area(I2);



%##########################
%labeledImage=bwlabel(I2);
%originalImage = imresize(originalImage,0.5);
%blobMeasurements = regionprops(labeledImage, 'all');
%numberOfBlobs = size(blobMeasurements, 1)

	%figure;	% Create a new figure window.
	% Maximize the figure window.
	%set(gcf, 'Units','Normalized','OuterPosition',[0 0 1 1]);
	%for k = 1 : numberOfBlobs           % Loop through all blobs.
		% Find the bounding box of each blob.
		%thisBlobsBoundingBox = blobMeasurements(k).BoundingBox ; 
      % thisBlobsBoundingBox(1) = thisBlobsBoundingBox(1) -100;
      % thisBlobsBoundingBox(2) = thisBlobsBoundingBox(2) -100;
      % thisBlobsBoundingBox(3) = thisBlobsBoundingBox(3) + 200;
      % thisBlobsBoundingBox(4) = thisBlobsBoundingBox(4) +200;
        % Extract out this coin into it's own image.
		%subImage = imcrop(originalImage, thisBlobsBoundingBox);
		
		% Display the image with informative caption.
		%subplot(7, 4, k);
		%imshow(subImage);
		
   % end

%###################





return