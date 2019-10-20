function [w, s] = NoteMaster(note, len, vol, bpm)

if strncmpi(note ,'r',inf) 
    lent = len *(60/bpm);
    w = zeros(1,floor(lent * 44100));
    s = size(w,2);
    return;
end

load('note.mat')
x = find(strncmpi(note ,list,inf));

notefrq = @(x) 440 * 2.^((x-69)/12);
frq = notefrq(x+23);% 23 is correct
% vol = 1;
Fs = 44100;
Ts = 1/Fs;
Length = (len * (60/bpm));% Input 2 80 or 120
time = 0:Ts:Length;
time = time(1:end-1);
x = vol * cos(2 * pi * time * frq);

% fade algorithm
k = 1000;
fadein = linspace(0,1,k);
fadeout = linspace(1,0,k);
x(1:k) = fadein .* x(1:k);
x(end-k+1:end) = fadeout .* x(end-k+1:end);
s = size(x,2);
w = x;
end