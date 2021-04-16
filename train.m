clc
close all;
clear all;
Dirp='E:\IMAGE\';
imagefiles = dir('E:\IMAGE\*.tiff');
imagefiles2 = dir('E:\IMAGE\*.tif');
%imagefiles3 = dir('D:\Deep_Learning_Paper\images\*.TIF');
imagefiles=[imagefiles;imagefiles2];

img=zeros([224,224,3]);
img(8:8:end-1,:,:)=255;

img(:,8:8:end-1,:)=255;
se = strel('square',2);
img=imdilate(img,se);
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   %currentimage = imread(currentfilename);
   name{ii} = currentfilename;
end
vector1=[];
vector2=[];

for i=1:nfiles  
	A = imread(strcat(Dirp, name{i}));
	[row,col,z]=size(A);
    if(row==512 && col==384)
		A=rot90(A);
        A= imresize(A, [224,224]);
    end
    A= imresize(A, [224,224]);
 	imwrite(A,sprintf('%04d.jpg',i),'Quality',40);
    %imwrite(img,sprintf('%04d.jpg',i),'Quality',100);
end

%save f2.mat;