%edges = cv2.Canny('D:\Research\recognition\ex3.jpg', thresh);
%imshow(edges);

sigma = 30;
lambda = 10;
n = 90;

openImage(n, sigma, 0, lambda);

numberOfAngles = 8;
numberOfLambdas = 1;
numberOfSigmas = 20;

for k = 1 : numberOfSigmas
    for  j = 1:numberOfLambdas
        for i = 0:(numberOfAngles - 1)
%            openImage(n, sigma * k, 2 * pi / numberOfAngles * i, lambda * j);
        end
    end
end