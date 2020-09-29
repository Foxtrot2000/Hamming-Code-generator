function [awgn_data] = channel_awgn(tx_data,sgma)

inoise = randn(1,length(tx_data)).*sgma;   %Real Part of Noise
qnoise = 1j.*randn(1,length(tx_data)).*sgma;  %Imaginary part of noise
awgn_data = tx_data + inoise+qnoise; 

end