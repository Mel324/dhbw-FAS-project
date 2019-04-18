function [ay_val, delta_val, dpsi_val] = QD_run_model(simTime, simStep, delta_h, rSoll, v, CvStern, ChStern, deltaControlled, lv, lh, is, m, theta, g)
%[ay_val, delta_val] = ESM_Run(deltaH, v, CvStern, ChStern)

%% Init Values
mDivTheta = m / theta;

% Grads to CStern
%EG = 0.1; % 0.0058
%SG = 0.1; % 0.005
%[CvStern, ChStern] = convGradToCStern(EG, SG, g);

% C to CStern
%Cv = 75000; % CvStern = 9.4854
%Ch = 150000; % ChStern = 20.5518
%[CvStern, ChStern] = convCToCStern(Cv, Ch, m, g, lv, lh);


%% Setup Simulation
load_system('QD_V1');
%Signal specifications
params = get_param('QD_V1','modelworkspace');
params.assignin('controller_on_delta', deltaControlled);
params.assignin('delta_h', delta_h);
params.assignin('soll_radius', rSoll);
params.assignin('v', v);
params.assignin('lv',lv);
params.assignin('lh',lh);
params.assignin('CvStern',CvStern);
params.assignin('ChStern',ChStern);
params.assignin('is',is);
params.assignin('mDivTheta',mDivTheta);
params.assignin('g',g);


%% Simulate
simOut = sim('QD_V1','Solver','ode4','FixedStep',num2str(simStep),'StopTime',num2str(simTime));
%simOut.who
ay = simOut.get('ay');
delta = simOut.get('delta');
%vy = simOut.get('vy');
dpsi = simOut.get('dpsi');
%alphaV = simOut.get('alphaV');
%alphaH = simOut.get('alphaH');

%% Plot 4_6
k = 0;
ay_k = ay.data(end,1);
while(ay_k < 2 && k < size(ay.data(end,:),2))
    k = k + 1;
    ay_k = ay.data(end,k);
end
ay_val = ay.data(end,:);
delta_val = delta.data(end,:);
dpsi_val = dpsi.data(end,:);
close_system('ESM',0);
%% Plot Results
%subplot(2,1,1);
%plot(vy);
%title('Vy');
%subplot(2,1,2);
%plot(dpsi);
%title('dPsi');

end