close all;
clear all;
clc

m=3;
data_size=1000;

ml = 1;         % Modulation Level : BPSK
M = 2^ml;
EbNo = 12;
SNR = 10^(EbNo/10);
sgma = 1/sqrt(2*SNR);
% Generate prbs data and encode the data using Hamming code
% general algorithm
[data, data_hamm] = encodeData(m, data_size);
        
% BPSK MOD/DEMOD ( AWGN Channel )
rdata_bpsk = bpsk_mod_demod(data, sgma);
rdata_bpsk_hamm = bpsk_mod_demod(data_hamm, sgma);
    
     
subplot(4,1,1)
stairs(data)
xlim([0 100])
ylim([-0.5 1.5])
title('Randomly generated Pulses')

subplot(4,1,2)
stairs(data_hamm)
xlim([0 100])
ylim([-0.5 1.5])
title('Hamming coded Pulses')

subplot(4,1,3)
stairs(rdata_bpsk)
xlim([0 100])
ylim([-0.5 1.5])
title('Received generated Pulses')

subplot(4,1,4)
stairs(rdata_bpsk_hamm)
xlim([0 100])
ylim([-0.5 1.5])
title('Received Hamming Pulses')


