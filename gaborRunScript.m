sigma = 30;
lambda = 10;
n = 20;
path = 'D:\Research\recognition\ex3.jpg';

gaborFilter(n, sigma, 0, lambda, path);

numberOfAngles = 1;
numberOfLambdas = 1;
numberOfSigmas = 1;

for k = 1 : numberOfSigmas
    for  j = 1:numberOfLambdas
        for i = 0:(numberOfAngles - 1)
%            gaborFilter(n, sigma * k, 2 * pi / numberOfAngles * i, lambda * j, path);
        end
    end
end