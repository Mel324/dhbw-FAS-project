function [CvStern, ChStern] = convGradToCStern(EG, SG, g, ChStern) 
    if(nargin == 3)
        % Lücke 4.25
        ChStern = 1./(g*SG);
    else
        SG = 1./(g*ChStern);
    end
    
    % Lücke 4.31
    CvStern = 1./(g*(EG+SG));
end



