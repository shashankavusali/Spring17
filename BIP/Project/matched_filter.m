function [ result ] = matched_filter(img, sigma, L,angle)
%UNTITLED7 Summary of this function goes here

matchrow = floor(L/2);
x = -3*sigma : 3* sigma;
matchfilter =  repmat(exp(-(x.^2)/(2*sigma.^2)),[matchrow*2+1, 1]);
m = sum(matchfilter(:))/numel(matchfilter);
matchfilter = -matchfilter + m;
matchfilter = imrotate(matchfilter,angle); 
imshow(matchfilter);
result = imfilter(img,matchfilter,'replicate');

end