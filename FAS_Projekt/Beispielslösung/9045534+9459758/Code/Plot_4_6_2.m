function Plot_4_6_2(plotInstance, rSoll, gravity, lv, lh, lEG, lSG, is, m, theta)
deltaControlled = 1;
deltaH = 0;
v = 2.5:1.0:20.0;
g = gravity;

EG = [max(-lEG, -lSG*0.9) 0 lEG];
SG = lSG;  % SG must be greater than min(EG)!
ChStern = 1./(g*SG); %20.5518;
% ChStern = 1 ./ (g * SG);
CvStern = convGradToCStern(EG, 0, g, ChStern);

simStep = 0.001 - (rSoll/50*0.0009);
simTime = 10 - (rSoll/50*9);

colors = [[0 0 0.5], [0.8 0.4 0], [0.5 0 0]];
hold(plotInstance,'off'); 

for k = 1:size(CvStern,2)
    [ay_val, delta_val] = ESM_Run(simTime, simStep, deltaH, rSoll, v, CvStern(k), ChStern, deltaControlled, lv, lh, is, m, theta, g);
    plot(plotInstance, ay_val, delta_val, 'LineWidth', 2, 'Color', colors((k-1)*3+1:k*3));
    hold(plotInstance,'on');
end
grid(plotInstance, 'on');
legend(plotInstance, strcat('EG=',num2str(EG(1),2)),  strcat('EG=',num2str(EG(2),2)), strcat('EG=',num2str(EG(3),2)), 'Location','northwest');

end
