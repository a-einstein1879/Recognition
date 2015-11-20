function [] = openImage(n, sigma, theta, lambda)
    imSize  = 200;
    neuronPicture = imread('D:\Research\recognition\ex3.jpg');
    neuronPicture = imresize(neuronPicture, [imSize imSize]);
    monochromeNeuronPicture = rgb2gray(neuronPicture);


    gb = zeros(imSize, imSize);
    
    for x = 1:imSize
        for y = 1:imSize
            gb(x, y) = gaborFunction(x, y, sigma, theta, lambda);
        end
    end
    
    gaborNeuronPicture = zeros(imSize, imSize);

    for x = (n/2 + 1):(imSize - n/2)
        for y = (n/2 + 1):(imSize - n/2)
            dot = 0;
            for i = 1:n
                for j = 1:n
                    delta = 1 / n^2 * monochromeNeuronPicture(x - n/2 + i, y - n/2 + j) * gb(i, j);
                    dot = dot + delta;
                end
            end
            gaborNeuronPicture(x, y) = dot;
        end
    end
    %imshow(monochromeNeuronPicture);
    %figure, imshow(gb);
    figure, imshow(~gaborNeuronPicture);
end

function gb = gaborFunction(x, y, sigma, theta, lambda)
    sigma_x = sigma;
    sigma_y = sigma;
    %sigma_x = 6;
    %sigma_y = 6;
    %theta   = 0;
    %lambda  = 15;
    
    x_theta =   x * cos(theta) + y * sin(theta);
    y_theta = - x * sin(theta) + y * cos(theta);
    
    x_theta = double(x_theta);
    y_theta = double(y_theta);
     
    gb = exp(-.5 * (x_theta^2/sigma_x^2 + y_theta.^2/sigma_y^2)) * cos(2 * pi/lambda * x_theta);
end