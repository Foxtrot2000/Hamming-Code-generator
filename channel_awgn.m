function [awgn_data] = channel_awgn(tx_data,sgma)

inoise = randn(1,length(tx_data)).*sgma;   %Real Part of Noise

awgn_data = tx_data + inoise; 

end
