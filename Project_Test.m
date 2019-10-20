%% Project Test P1
clc

load('note.mat')
x1 = find(strncmp('C4' ,list,inf));

notefrq = @(x) 440 * 2.^((x-69)/12);
x1 = x1+23;
frq = notefrq(x1);
vol = 1;
Fs = 44100;
Ts = 1/Fs;
Length = 10;
time = 0:Ts:Length;
time = time(1:end-1);
x = vol * cos(2 * pi * time * frq);

% fade algorithem
k = 1000;
fadein = linspace(0,1,k);
fadeout = linspace(1,0,k);
x(1:k) = fadein .* x(1:k);
x(end-k+1:end) = fadeout .* x(end-k+1:end);

plot(x)
sound(x,Fs)

%% P2
bpm = 120;
Fs = 44100;
[w1 ,~] = NoteMaster('B2',2,1,bpm);
[w2 ,~] = NoteMaster('B1',2,1,bpm);
[w3 ,~] = NoteMaster('r',.5,1,bpm);
[w4 ,~] = NoteMaster('B2',.5,1,bpm);
[w5 ,~] = NoteMaster('B1',.5,1,bpm);

voice =  [w1; w2];
voice = [voice(1, :) w3 w4
         voice(2,:) w3  w5];
sound(voice , Fs);

%%
Fs = 44100;
bpm = 120;
[w1 ,~] = NoteMaster('B4',1.5,1,bpm);

[w2 ,~] = NoteMaster('b3',1.5,1,bpm);
[w4 ,~] = NoteMaster('B2',1.5,1,bpm);
w3 = w1 + w2;
w3 = w3 +w4;
w3 = .9*w3(1:end)/max(abs(w3(1:end)));
sound(w3,Fs)
%%
load('song.mat')
w = MixMaster(song,1,BPM);
fw = fft(w);
%sound(w,Fs,16);
%plot(w)
%wp =  reshape(repmat(w,1,1),1,[]);
wp = w(1:5/4:end);
sound(w,Fs);
%%
wave = [];
for i = f
   w = ToneMaster(i,.25); 
   wave = [wave w];
end

%%
clear sound