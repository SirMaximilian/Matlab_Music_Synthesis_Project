%% Project 3

load('song.mat')
original = MixMaster(song,1,BPM);
sound(original,Fs,16);
%%
audiowrite('DragonBorn.wav',original,Fs)
info = audioinfo('DragonBorn.wav');
disp(info.SampleRate)
disp(info.TotalSamples)
%%
w = original;
while true
   clc
   fprintf('1)Fade In\n2)Fade Out\n3)Pitch up\n4)Pitch down\n5)Plot\n6)Normalize\n7)Reset Vector\n8)Stop Sound\n9)Exit\n')
   x = input('Enter Choice: ');
   switch x
       case 1
           w = fade(w,'in');
           sound(w,Fs,16);
       case 2
           w = fade(w,'out');
           sound(w,Fs,16);
       case 3 %dont like thes methods
           w = w(1:1.5:end);
           sound(w,Fs,16);
       case 4
           w = w(1:.5:end);
           sound(w,Fs,16);
       case 5
           plot(w);
       case 6
           disp('Normalizing')
           w = .9*w(1:end)/max(abs(w(1:end)));
           sound(w,Fs,16);
       case 7
           w = original;
       case 8
           clear sound
       case 9
           clear sound
           disp('exiting')
           audiowrite('DragonBorn_Modified.wav',w,Fs)
           break
       otherwise
           disp('Invalid Input')
   end
end

%type NoteMaster
%type MixMaster
%type fade
%type Song
%type Notes