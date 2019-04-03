function [CvStern, ChStern] = convCToCStern(Cv, Ch, m, g, lv, lh)
    % L�cke 4.4
    ChStern = Ch * (lv+lh) / lv / m / g;
    CvStern = Cv * (lv+lh) / lh / m / g;
end