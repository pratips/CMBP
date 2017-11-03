% Program for channel identification

% Read the folder
path='NILM\';

list=dir([path, '*.jpg']);
for x=1:length(list)
    
    format = '%d Image is under processing';
    str = sprintf(format,x);
    disp(str);
    
    
    %Reading the input files
    images{x}=imread([path, list(x).name]);
    img = images{x};
    
    
    formatSpec_org = 'original%d.jpg';
    stro1 = sprintf(formatSpec_org,x)
    stro2 = 'OUTPUT\';
    s_o = strcat(stro2,stro1);
    imwrite(img,s_o);    
    
    
    
 %Red, Green, Blue component
    red = img(:,:,1);
    green = img(:,:,2);
    blue = img(:,:,3);
    just_red = cat(1,red);
    just_green = cat(1,green);
    just_blue = cat(1,blue);

    %RED component
    formatSpec_red = 'red%d.jpg';
    strr1 = sprintf(formatSpec_red,x)
    strr2 = 'OUTPUT\';
    s_r = strcat(strr2,strr1);
    imwrite(just_red,s_r);
    
    %Green component
    formatSpec_green = 'green%d.jpg';
    strg1 = sprintf(formatSpec_green,x)
    strg2 = 'OUTPUT\';
    s_g = strcat(strg2,strg1);
    imwrite(just_green,s_g);
    
    %Blue component
    formatSpec_blue = 'blue%d.jpg';
    strb1 = sprintf(formatSpec_blue,x)
    strb2 = 'OUTPUT\';
    s_b = strcat(strb2,strb1);
    imwrite(just_blue,s_b);




%CMY Model
f = im2double(img);
r=f(:,:,1);
g=f(:,:,2);
b=f(:,:,3);
c = 1-r;
m = 1-g;
y = 1-b;
c = cat(1,c);
m = cat(1,m);
y = cat(1,y);
    
    %cyan component write
    formatSpec_cyan = 'cyan%d.jpg';
    strc1 = sprintf(formatSpec_cyan,x)
    strc2 = 'OUTPUT\';
    s_c = strcat(strc2,strc1);
    imwrite(c,s_c);
    
    %megenta component write
    formatSpec_magenta = 'magenta%d.jpg';
    strm1 = sprintf(formatSpec_magenta,x)
    strm2 = 'OUTPUT\';
    s_m = strcat(strm2,strm1);
    imwrite(m,s_m);
    
    %megenta component write
    formatSpec_yel = 'yellow%d.jpg';
    stry1 = sprintf(formatSpec_yel,x)
    stry2 = 'OUTPUT\';
    s_y = strcat(stry2,stry1);
    imwrite(y,s_y);


%HSV model
h_model=rgb2hsv(img);
%figure, imshow(h_model), title('HSV image')
%imwrite(h_model,'C:\Users\Infra\Documents\MATLAB\hsv.jpg')
h=h_model(:,:,1);
s_r=h_model(:,:,2);
v=h_model(:,:,3);
hue = cat(1,h);
satu = cat(1,s_r);
valo = cat(1,v);

    %Hue component write
    formatSpec_hue = 'hue%d.jpg';
    strh1 = sprintf(formatSpec_hue,x)
    strh2 = 'OUTPUT\';
    s_h = strcat(strh2,strh1);
    imwrite(hue,s_h);
    
    %Saturation component write
    formatSpec_sat = 'saturation%d.jpg';
    strs1 = sprintf(formatSpec_sat,x)
    strs2 = 'OUTPUT\';
    s_s = strcat(strs2,strs1);
    imwrite(satu,s_s);
    
    %Intensity component write
    formatSpec_int = 'intensity%d.jpg';
    stri1 = sprintf(formatSpec_int,x)
    stri2 = 'OUTPUT\';
    s_i = strcat(stri2,stri1);
    imwrite(valo,s_i);


%YcbCR model
ycbcr=rgb2ycbcr(img);
%figure, imshow(ycbcr), title('YCbCr image')
y = ycbcr(:,:,1);
cb = ycbcr(:,:,2);
cr = ycbcr(:,:,3);
just_y = cat(1,y);
just_cb = cat(1,cb);
just_cr = cat(1,cr);
    %Y component write
    formatSpec_y = 'Y%d.jpg';
    str_y1 = sprintf(formatSpec_y,x)
    str_y2 = 'OUTPUT\';
    s_Y = strcat(str_y2,str_y1);
    imwrite(just_y,s_Y);
    
    
    %Cb component write
    formatSpec_cb = 'Cb%d.jpg';
    strcb1 = sprintf(formatSpec_cb,x)
    strcb2 = 'OUTPUT\';
    s_cb = strcat(strcb2,strcb1);
    imwrite(just_cb,s_cb);
    
    %Cr component write
    formatSpec_cr = 'Cr%d.jpg';
    strcr1 = sprintf(formatSpec_cr,x)
    strcr2 = 'OUTPUT\';
    s_cr = strcat(strcr2,strcr1);
    imwrite(just_cr,s_cr);
    
    
    
       
    
    
    
    
    
end
