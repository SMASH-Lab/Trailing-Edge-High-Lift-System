function [ ] = PlotGrafici( d,v )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

ara=[255, 165, 0]/255; azz=[0, 127, 255]/255; gia=[255, 216, 0]/255;
vio=[143, 0, 255]/255; ros=[216, 36, 79]/255; ver=[60, 179, 113]/255;

ara=[255, 191, 0]/255; azz=[0, 208, 255] / 255;
%ros=[244, 66, 66]/255; 
ros=[255, 61, 61]/255; blu=[5, 0, 178] / 255; ver=[0, 255, 114] / 255;
lw=1.5;

% Req 1 X
figure

plot(d.CuTr(:,4),d.CuTr(:,1),'Color',ver), hold on
plot(d.DrHi(:,4),d.DrHi(:,1),'Color',azz),   hold on
plot(d.FB2(:,4),d.FB2(:,1),'Color',ara),   hold on
plot(d.FoBa(:,4),d.FoBa(:,1),'Color',ros),   hold on
plot(d.HoTr(:,4),d.HoTr(:,1),'Color',vio),   hold on
plot(d.LiTr(:,4),d.LiTr(:,1),'Color',blu),   hold on

plot_Finestra(v.Dmin_T, v.Dmax_T, v.Xmin_T ,v.Xmax_T, -50, 750,lw);
plot_Finestra(v.Dmin_L, v.Dmax_L, v.Xmin_L ,v.Xmax_L, -50, 750,lw);

legend('CuTr','DrHi','FB2','FoBa','HoTr','LiTr')
%legend('CurvedTrack','DroopedHinge','FB2','HoTr')
xlabel('Deployment Angle (deg)'),ylabel('X-X0 (mm)'), grid on
%0:2.5:40
set(gca,'xtick',[0,10,14,15,16,20,25,30,34,35,36,40])
set(gca,'ytick',0:50:750)
xlim([-2.5 40])
ylim([-50 750])
title('Req 1 X')

hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)

% Req 2 Y
figure

plot(d.CuTr(:,1),d.CuTr(:,2),'Color',ver), hold on
plot(d.DrHi(:,1),d.DrHi(:,2),'Color',azz),   hold on
plot(d.FB2(:,1),d.FB2(:,2),'Color',ara), hold on
plot(d.FoBa(:,1),d.FoBa(:,2),'Color',ros), hold on
plot(d.HoTr(:,1),d.HoTr(:,2),'Color',vio),   hold on
plot(d.LiTr(:,1),d.LiTr(:,2),'Color',blu), hold on

xlabel('X-X0 (mm)'),ylabel('Y-Y0 (mm)'), grid on
set(gca,'ytick',-10:10:120)
xlim([-10 710]),
ylim([-10 120])
title('Req 2 Y')
%axis([0 10 0 10])
hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)

plot(v.x,v.Ymax,'k--','LineWidth',2), hold on
plot(v.x,v.Ymin,'k--','LineWidth',2), hold on
legend('CuTr','DrHi','FB2','FoBa','HoTr','LiTr','Ymax','Ymin')
% Req 2b 
% figure
% 
% plot(d.time,v.Ymax,'k'), hold on
% plot(d.time,v.Ymin,'k'), hold on
% 
% plot(d.time,d.CuTr(:,2),'Color',ver), hold on
% plot(d.time,d.DrHi(:,2),'Color',azz),   hold on
% plot(d.time,d.FB2(:,2),'Color',ara), hold on
% plot(d.time,d.HoTr(:,2),'Color',vio),   hold on
% 
% legend('Ymax','Ymin','CuTr','DrHi','FB2','HoTr')
% xlabel('time (sec)'),ylabel('Y-Y0 (mm)')%, grid on
% set(gca,'ytick',-10:10:120)
% ylim([-10 120])
% title('Req 2b')
% %axis([0 10 0 10])
% hline = findobj(gcf, 'type', 'line');
% set(hline,'LineWidth',lw)


% Req 3 Z
figure

plot(d.CuTr(:,1),d.CuTr(:,3),'Color',ver), hold on
plot(d.DrHi(:,1),d.DrHi(:,3),'Color',azz),   hold on
plot(d.FB2(:,1),d.FB2(:,3),'Color',ara), hold on
plot(d.FoBa(:,1),d.FoBa(:,3),'Color',ros), hold on
plot(d.HoTr(:,1),d.HoTr(:,3),'Color',vio),   hold on
plot(d.LiTr(:,1),d.LiTr(:,3),'Color',blu),   hold on

plot_Finestra(v.Xmin_T, v.Xmax_T, v.Zmin_T ,v.Zmax_T, 50, -400,lw);
plot_Finestra(v.Xmin_L, v.Xmax_L, v.Zmin_L ,v.Zmax_L, 50, -400,lw);

legend('CuTr','DrHi','FB2','FoBa','HoTr','LiTr')
xlabel('X-X0 (mm)'),ylabel('Z-Z0 (mm)'), grid on
xlim([-25 750])
title('Req 3 Z')

hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)

% Req 4
figure

plot(d.CuTr(:,1),d.CuTr(:,6),'Color',ver), hold on
plot(d.DrHi(:,1),d.DrHi(:,6),'Color',azz),   hold on
plot(d.HoTr(:,1),d.HoTr(:,6),'Color',vio),   hold on
plot(d.FB2(:,1),d.FB2(:,6),'Color',ara),   hold on

legend('CuTr','DrHi','HoTr','FB2')
xlabel('X-X0 (mm)'),ylabel('dq / dx'), grid on
%set(gca,'ytick',-10:10:120)
% xlim([-10 710]),
% ylim([-10 120])
title('Req 4')
%axis([0 10 0 10])
hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)

figure

plot(d.CuTr(:,1),d.CuTr(:,6),'Color',ver), hold on
plot(d.DrHi(:,1),d.DrHi(:,6),'Color',azz),   hold on
plot(d.HoTr(:,1),d.HoTr(:,6),'Color',vio),   hold on
plot(d.FB2(:,1),d.FB2(:,6),'Color',ara),   hold on

legend('CuTr','DrHi','HoTr','FB2')
xlabel('X-X0 (mm)'),ylabel('dq / dx'), grid on
%set(gca,'ytick',-10:10:120)
% xlim([-10 710]),
ylim([-0.5 0.5])
title('Req 4 limited')
% axis([0 10 0 10])
hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)

figure

plot(d.CuTr(:,1),d.dq_C,'Color',ver), hold on
plot(d.DrHi(:,1),d.dq_D,'Color',azz),   hold on
plot(d.HoTr(:,1),d.dq_L,'Color',vio),   hold on
plot(d.FB2(:,1),d.dq_FB2,'Color',ara),   hold on

legend('CuTr','DrHi','HoTr','FB2')
xlabel('X-X0 (mm)'),ylabel('dq / dx'), grid on
%set(gca,'ytick',-10:10:120)
% xlim([-10 710]),
% ylim([-1 1])
title('Req 4 cutted')
% axis([0 10 0 10])
hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)

% Req 5 h
figure

plot(d.time,d.CuTr(:,5),'Color',ver), hold on
plot(d.time,d.DrHi(:,5),'Color',azz),   hold on
plot(d.time,d.FB2(:,5),'Color',ara), hold on
plot(d.time,d.FoBa(:,5),'Color',ros), hold on
plot(d.time,d.HoTr(:,5),'Color',vio),   hold on
plot(d.time,d.LiTr(:,5),'Color',blu),   hold on

legend('CuTr','DrHi','FB2','FoBa','HoTr','LiTr')
xlabel('time'),ylabel('h(t)'), grid on
%xlim([-25 750])
title('Req 5 h')

hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)

% Req 6 Tmg
figure

plot(d.time,d.CuTr(:,7),'Color',ver), hold on
plot(d.time,d.DrHi(:,7),'Color',azz),   hold on
plot(d.time,d.FB2(:,7),'Color',ara), hold on
plot(d.time,d.FoBa(:,7),'Color',ros), hold on
plot(d.time,d.HoTr(:,7),'Color',vio),   hold on
plot(d.time,d.LiTr(:,7),'Color',blu), hold on

legend('CuTr','DrHi','FB2','FoBa','HoTr','LiTr')
xlabel('time'),ylabel('N x m'), grid on
%xlim([-25 750])
title('Req 6 Tmg')

hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)

end

