function w = ToneMaster(frq,len)
Fs = 44100;
Ts = 1/Fs;
time = 0:Ts:len;
time = time(1:end-1);
%frq = 5:10:40000;
x = sin(2 * pi * time * frq);

% fade algorithm
% k = 1000;
% fadein = linspace(0,1,k);
% fadeout = linspace(1,0,k);
% x(1:k) = fadein .* x(1:k);
% x(end-k+1:end) = fadeout .* x(end-k+1:end);
% s = size(x,2);
w = x;
end