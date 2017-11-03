function bw2=delete_obj()

im = imread('segmentated_output.jpg');
%figure,imshow(im);
threshold = graythresh(im);
bw = im2bw(im,threshold);

L = bwlabel(bw);
stats = regionprops(L,'Area','Centroid','Perimeter','Eccentricity');
area_values = [stats.Area];
per_values = [stats.Perimeter];

for i=1:length(area_values)
pi=3.14;
metric(i) = 4*pi*area_values(i)/power(per_values(i),2);

end


idx = find(metric>0.71);
bw2 = ismember(L, idx);
%figure,imshow(bw2),title('Final Output');
%imwrite(bw2,'final_output.jpg');
return