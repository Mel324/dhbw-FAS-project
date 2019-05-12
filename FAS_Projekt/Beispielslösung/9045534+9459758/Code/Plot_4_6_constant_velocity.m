function Plot_4_6_constant_velocity(plotInstance, vStart, gravity, lv, lh, lEG, lSG, is, m, theta)

deltaControlled = 0;
deltaH = 0:0.02:6;

v = vStart;
v_array = v * ones(1,301);

g = gravity;

EG = [max(-lEG, -lSG*0.9) 0 lEG];
SG = lSG;  % SG must be greater than min(EG)!
ChStern = 1./(g*SG); %20.5518;
% ChStern = 1 ./ (g * SG);
CvStern = convGradToCStern(EG, 0, g, ChStern);

colors = [[0 0 0.5], [0.8 0.4 0], [0.5 0 0]];

hold(plotInstance,'off');
for k = 1:size(CvStern,2)
    [ay_val, delta_val] = QD_run_model(10, 0.01, deltaH, 1, v_array, CvStern(k), ChStern, deltaControlled, lv, lh, is, m, theta, g);
    
    plot(plotInstance, ay_val, delta_val, 'LineWidth', 2, 'Color', colors((k-1)*3+1:k*3));
    hold(plotInstance,'on');
end
grid(plotInstance,'on');
legend(plotInstance, strcat('EG=',num2str(EG(1),2)),  strcat('EG=',num2str(EG(2),2)), strcat('EG=',num2str(EG(3),2)), 'Location','northwest'); %'EG='+num2str(EG(2)), 'EG='+num2str(EG(3))

end