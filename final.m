close all;
clear all;
clc

m=3;
data_size=1000;

ml = 1;         % Modulation Level : BPSK
M = 2^ml;
EbNo = 0:1:12;
u = length(EbNo);


for iii = 1:u           % ebn0 loop
    
    
    %nloop = 100;       % # of simulation loop
        
    SNR = 10^(EbNo(iii)/10);
    sgma = 1/sqrt(SNR);
    
    
        % Generate prbs data and encode the data using Hamming code
        % general algorithm
        [data, data_hamm] = encodeData(m, data_size);
        encoded_data=bpsk_mod(data);
        noised_data= channel_awgn(encoded_data, sgma);
        % BPSK MOD/DEMOD ( AWGN Channel )
        rdata_bpsk = bpsk_mod_demod(data, sgma);
        rdata_bpsk_hamm = bpsk_mod_demod(data_hamm, sgma);
        
     error= biterr(rdata_bpsk, data);
     disp(error);
        
end    
subplot(3,1,1)
stairs(data)
xlim([0 100])
ylim([-0.5 1.5])
title('Randomly generated Pulses')

subplot(3,1,2)
stairs(data_hamm)
xlim([0 100])
ylim([-0.5 1.5])
title('Hamming coded Pulses')

subplot(3,1,3)
stairs(noised_data)
xlim([0 100])
title('Noise Added thorugh AWGN')

