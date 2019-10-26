clear;
N=10^6;
%transmitter
ip1=rand(1,N)>0.5;
s1=2*ip1-1;
n=1/sqrt(2)*[randn(1,N)+j*randn(1,N)];%GUASSIAN noise
