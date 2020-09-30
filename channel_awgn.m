function [awgn_data] = channel_awgn(tx_data,sgma)

inoise = randn(1,length(tx_data)).*sgma;   % Noise Generated through randn

awgn_data = tx_data + inoise; 

end
