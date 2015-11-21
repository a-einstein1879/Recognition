%% Setup
% Set up test data
peppers   = rgb2gray(imread('D:\Research\recognition\ex3.jpg'));

%% Compute
% Invoke mex function to search for matches between an image patch and an
% input image.
result = Canny(peppers);

%% Show Results
% Show the input image and the result of normalized cross correlation
subplot(1,2,1);
imshow(peppers); title('Input Image');
subplot(1,2,2);
imshow(result,[]); title('Result of applied filter');
truesize; % make the figure tight