clear;clc;
%Analytical PDF===> x~N(m,sigma) 
[f,x]=hist(1+2.*randn(1000000,1),100);%1==>mean 2===>varience.....randn(,1) produces the normal distributed values here parameters are MEAN AND vARIENCE
% It by defau;t generates the numbers wth 0 MEAN and 1 varence
%here 100 represents the grouping of the dstribution into 100 groups

bar(x,f/trapz(x,f));hold on;%trapz takes the x-values and finds the area under it .e integral(f(x).dx))
%Generally, Normal PDF has the area as 1. Here,f/trapz is for the normalisation and makes the area to 1
%simulated usng formula===>1/sqrt(2*pi*sigma^2)*exp(-0.5*(x-1).^2/(sigma)^2)
g=1/sqrt(2*pi*4)*exp(-0.5*(x-1).^2/(4));%density function
plot(x,g,'r');hold off;
