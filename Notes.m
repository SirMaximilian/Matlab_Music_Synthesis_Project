%% Create convergen list of notes
f = [];
note = {'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#' 'A' 'A#' 'B'};
for i = 1:7
    f{i} = strcat(note, num2str(i));
end
list = [];
for i = 1:7
    for j = 1:12
        list = [list f{1,i}(j)];
    end
end
nums = 23:106;
save note list nums