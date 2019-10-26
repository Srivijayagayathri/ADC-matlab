%symbol error rate for 10-PSK modulation
N=2*10^5;%no o symbols
thetaMpsk=[0:M-1]*2*p/M %reerence Phase values
Es_N0_dB=[0:25]; %multiple Es/N0 values
ipPhaseHat=zeros(1,N);
for ii=1:length(Es_N0_dB)
    %symbol generation
    ipPhase=randsrc(1,N,thetaMpsk);
    ip=exp(j*ipPhase);
    s=ip;%normalisation of energy to 1
    %noise
    %------
    n=1/sqrt(2)*[randn(1,N)+j*randn(1,N)];%white guassian noise 0dB varience
   