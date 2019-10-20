function w = MixMaster(song,vol,bpm)
    w = [];
    for i = 1:size(song ,2)% get number of measures
        [~,s] = NoteMaster('r',3, vol ,bpm);
        tempW = zeros(1,s);
        for k = 1:size(song{i},1)
            tW1 =[];
            ts =0;
            for j = 1:2:size(song{i},2)% number of notes in measure
                
                n = song{i}{k,j};
                n2 = song{i}{k,j+1};
                [tW2 ,s2] = NoteMaster(n,n2, vol ,bpm);
                tW1 = [tW1 tW2];
                ts = ts + s2;
            end
            
            if(size(tW1,2) < s)% if temp wave form is less than 3 sec add padding
                dif = s - size(tW1,2);
                tW1 = [tW1 zeros(1,dif)];
            elseif(size(tW1,2) > s)
                disp('Possible error: time over 3s?')
            end
            tempW = tempW + tW1;
        end
        w = [w tempW];
    end
    w = .9*w(1:end)/max(abs(w(1:end)));
end