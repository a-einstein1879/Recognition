%% Setup
% Set up test data
neuronPicture = imread('D:\Research\recognition\ex2.jpg');
L = rgb2gray(neuronPicture);

h  = fspecial('average', 60);
L1 = imfilter(L, h, 'replicate');
L2 = L - L1;
L3 = adapthisteq(L2);
level = graythresh(L3);
L4 = im2bw(L3, level);

%L5 = adapthisteq(L4);

sz = size(L4);
%L5 = zeros(sz(1), sz(2));
for x = 1:sz(1)
    for y = 1:sz(2)
        if (L4(x, y))
%            L5(x, y) = L(x, y);
        else
%            L5(x, y) = 0;
        end
        
        % uint8(~L4(x, y))
    end
end


%L4 = roicolor(L3, 50, 160);
%h  = fspecial('average', 15);
%L5 = ~imfilter(L4, h, 'replicate');

% standart methods
%L1 = histeq(L);
%L2 = ~edge(L, 'sobel');
%L2 = roicolor(L, 115, 160);
%L3 = roicolor(L1, 115, 160);

% But you can tell imfilter to handle image borders by replicating the border pixel values. That often produces a more desirable result:
subplot(2,3,1), subimage(L);
subplot(2,3,2), subimage(L1);
subplot(2,3,3), subimage(L2);
subplot(2,3,4), subimage(L3);
subplot(2,3,5), subimage(L4);
subplot(2,3,6), subimage(L5);
return;
im = neuronPicture;
%Фильтрация с целью повышения резкости.
h=fspecial('unsharp', 0.1);
imsharp=imfilter(im, h);
%Вывод исходного и полученного изображения в одно окно.
figure;
subplot(1,2,1), subimage(im);
subplot(1,2,2), subimage(imsharp);
return;

%% Compute
% Invoke mex function to search for matches between an image patch and an
% input image.
%filter = fspecial('unsharp', 0.25);
%imsharp = imfilter(neuronPicture, filter);
%imsharp = neuronPicture.*1.7;
%edges = edge(rgb2gray(neuronPicture));

%neuronPicture = rgb2gray(neuronPicture);
%result = Canny(neuronPicture);
%imtool(neuronPicture, [110 140]);

%% Show Results
% Show the input image and the result of normalized cross correlation
%subplot(1,2,1), subimage(neuronPicture); title('Input Image');
%subplot(1,2,2), subimage(imsharp); title('Sharpen Image');
%subplot(1,3,3), subimage(edges); title('Result of applied filter');
%imshow(result);
%truesize; % make the figure tight

neuronPicture = rgb2gray(neuronPicture);
%neuronPicture = neuronPicture.* (1.5);
sz = size(neuronPicture);
imtool(neuronPicture, [100 160]);
for x = 1:sz(1)
    for y = 1:sz(2)
        if (neuronPicture(x, y) <= 100) neuronPicture(x, y) = 0; end %#ok<SEPEX>
        if (neuronPicture(x, y) >= 160) neuronPicture(x, y) = 255; end %#ok<SEPEX>
    end
end
imshow(neuronPicture);