 function [H, G, n, k] = hmGenerator(m)


%
% H : parity-check matrix
% G : generator matrix
% n : block length
% k : message length

n = (2^m)-1;
k = n-m;

% Generate [n x m] parity-check matrix H
H = zeros(m,n);
for X = 1:m
    for Y = 0:length(H)-1
        kk = Y<n/2^X;
        if kk
            Z = ((2^X)*Y+2^(X-1)):((2^X)*Y+(2^X)-1);
            H(X,Z) = 1;
        end
    end
end

% Generate generator matrix G
% Extract parity matrix
for row = 1:m    % ii : row number 1~k th row
    column = 1;    % iii : column number
    cn = 0;     % H matrix column number
    for i=1:n   % H matrix column search
        if i == 2^cn
            cn = cn + 1;
            continue
        end
        gg(row, column) = H(row, i);
        column = column + 1;
    end
end

% Combine parity matrix and identity matrix
gg = gg';
G = zeros(k,n);
I = eye(k);
cn = 1;     % H matrix parity column number
ii = 1;     % identity matrix column number
for i=1:n   % H matrix column search
    if i == 2^(cn-1)
        G(:, i) = gg(:, cn);
        cn = cn + 1;
        continue
    end
    G(:, i) = I(:, ii);
    ii = ii + 1;
end

G = G';