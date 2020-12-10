clear; close all; clc;

sim_time=15;
tc=1/1000;
n_camp=sim_time/tc + 1;
Time=[0:tc:sim_time]';
d.time=Time;

%% Dati simulazione d
% lettura da file Excel e salvataggio in file .m
leggi_file=0
if(leggi_file)
    filename = 'Simulations_Data.xlsx';
    matrix='D2:J15002';
    % D     E     F     G    H    I         J
    % X-X0  Y-Y0  Z-Z0  DA   h    dq/dx     Tmg
    % 1     2     3     4    5    6         7
    
    d.CuTr = xlsread(filename,1,matrix);
    d.DrHi = xlsread(filename,2,matrix);
    d.FB2 = xlsread(filename,3,matrix);
    d.FoBa = xlsread(filename,4,matrix);
    d.HoTr = xlsread(filename,5,matrix);
    d.LiTr = xlsread(filename,6,matrix);
    
    % Req 4
%     dq_C=cutValues(d.CuTr(:,6),q_max, q_min)
%     dq_D=cutValues(d.DrHi(:,6),q_max, q_min)
%     dq_L=cutValues(d.LiTr(:,6),q_max, q_min)
% 
%     d.CuTr(:,6)=[dq_C(1,1); dq_C];
%     d.DrHi(:,6)=[dq_D(1,1); dq_D];
%     d.LiTr(:,6)=[dq_L(1,1); dq_L];

    
    save('excel_data.mat','d');
else
    % Carica file .m con i dati di simulazione
    load('excel_data.mat');
    
end
%% Vincoli v

% Req 1
v.Dmin_T=14;  v.Dmax_T=16;
v.Xmin_T=300; v.Xmax_T=400;

v.Dmin_L=34;  v.Dmax_L=36;
v.Xmin_L=650; v.Xmax_L=700;

% Req 2
alpha=2;
Kmax=(100-alpha)/600;
Kmin=(80+alpha)/600;
v.x=(0: 700/15000 :700)';

v.Ymin=Kmin*v.x-alpha;
v.Ymax=Kmax*v.x+alpha;

v1=Kmax * (-5) + alpha;
v2=Kmax * (700) + alpha;
v3=Kmin * (700) - alpha;
v4=Kmin * (-5) - alpha;
v5=v1;
v.box=[-5,  v1; 700, v2; 700, v3; -5,   v4; -5,  v5];

% Req 3
v.Zmin_T=-150; v.Zmax_T=-50;

v.Zmin_L=-385; v.Zmax_L=-320;

% Req 4
q_max=0.3;
q_min=-0.2;
d.dq_C=cutValues(d.CuTr(:,6),q_max, q_min);
d.dq_D=cutValues(d.DrHi(:,6),q_max, q_min);
d.dq_H=cutValues(d.HoTr(:,6),q_max, q_min);
d.dq_FB2=cutValues(d.FB2(:,6),q_max, q_min);
% d.CuTr(:,6)=[dq_C(1,1); dq_C];
% d.DrHi(:,6)=[dq_D(1,1); dq_D];
% d.LiTr(:,6)=[dq_L(1,1); dq_L];

%% Plot Requisiti
PlotGrafici(d,v);


%% Genera file con tabelle per Amesim e OModelica

return 
vname=@(x) inputname(1);
ext='.dat';

mechName='CuTr_'; mech=d.CuTr;
file=strcat(mechName,'t_X', ext); saveToFileAME(file, Time, mech(:,1))
file=strcat(mechName,'t_Y', ext); saveToFileAME(file, Time, mech(:,2))
file=strcat(mechName,'t_Z', ext); saveToFileAME(file, Time, mech(:,3))
file=strcat(mechName,'t_DA', ext); saveToFileAME(file, Time, mech(:,4))

mechName='DrHi_'; mech=d.DrHi;
file=strcat(mechName,'t_X', ext); saveToFileAME(file, Time, mech(:,1))
file=strcat(mechName,'t_Y', ext); saveToFileAME(file, Time, mech(:,2))
file=strcat(mechName,'t_Z', ext); saveToFileAME(file, Time, mech(:,3))
file=strcat(mechName,'t_DA', ext); saveToFileAME(file, Time, mech(:,4))

mechName='FB2_'; mech=d.FB2;
file=strcat(mechName,'t_X', ext); saveToFileAME(file, Time, mech(:,1))
file=strcat(mechName,'t_Y', ext); saveToFileAME(file, Time, mech(:,2))
file=strcat(mechName,'t_Z', ext); saveToFileAME(file, Time, mech(:,3))
file=strcat(mechName,'t_DA', ext); saveToFileAME(file, Time, mech(:,4))

mechName='HoTr_'; mech=d.HoTr;
file=strcat(mechName,'t_X', ext); saveToFileAME(file, Time, mech(:,1))
file=strcat(mechName,'t_Y', ext); saveToFileAME(file, Time, mech(:,2))
file=strcat(mechName,'t_Z', ext); saveToFileAME(file, Time, mech(:,3))
file=strcat(mechName,'t_DA', ext); saveToFileAME(file, Time, mech(:,4))