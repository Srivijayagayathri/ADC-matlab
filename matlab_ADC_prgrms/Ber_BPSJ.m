clear;
N=10^6;
%rand('state',100);
%randn('state',200);
%///transmitter\\\
ip=rand(1,N)>0.5;
s=2*ip-1;%symbol assignment 0->-1 1->1
n=1/sqrt(2)*[randn(1,N)+j*randn(1,N)];%; %white gaussian noise ,0db varience
Eb_N0_dB=[-3:10]; %multiple Eb/N0 nothing but SNR
for ii=1:length(Eb_N0_dB)
    y=s+10^(-Eb_N0_dB(ii)/20)*n; %additive white gaussian
    
    ipHat=real(y)>0;%receiver -hard decision decoding
    nErr(ii)=size(find([ip-ipHat]),2);%counting errors we can also use XOR operation
    %ii,disp([ip-ipHat]),nErr,
    
end
simBer=nErr/N;%simulated BER
theoryBer=0.5*erfc(sqrt(10.^(Eb_N0_dB/10))); %THEOETICAL ber
%plot
close all
figure
semilogy(Eb_N0_dB,theoryBer,'b*-');
hold on
semilogy(Eb_N0_dB,simBer,'mx-');
axis([-3 10 10^-5 0.5])
grid on
legend('theory','simulation');
xlabel('Eb/N0,dB');
ylabel('BitError Rate');
title('Bit error probablity curve for BPSK modulation');

    