function w = fade(w,x)
    s = size(w,2);
    if strncmpi(x ,'in',inf)
        fadein = linspace(0,1,s);
        w = fadein .* w;
    elseif strncmpi(x ,'out',inf)
        fadeout = linspace(1,0,s);
        w = fadeout .* w;
    else
        error('Invalid Arg');
    end
end