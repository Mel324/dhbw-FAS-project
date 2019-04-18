function ChStern = convEGtoCStern(EG, CvStern, g)
    
    %SG = 1 / CvStern / g - EG;
    
    % Lücke 4.20:
    % EG = 1 / g * ( 1 / CvStern - 1 / ChStern)
    % EG * g = 1 / CvStern - 1 / ChStern
    % 1 / ChStern = 1 / CvStern - EG * g 
    % ChStern = 1 / ( 1 / CvStern - EG * g )
    ChStern = 1 ./ ( 1 / CvStern - EG * g );
end