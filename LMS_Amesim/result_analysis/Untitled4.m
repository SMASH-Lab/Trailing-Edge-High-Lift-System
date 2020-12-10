if(1==0)
f=figure;
set(f,'position',[left, bottom, width, height]);

% Potenza attiva P1 P2
subplot(2,1,1)
plot(camp,Pmpp(1,:),'r'), hold on
plot(camp,P(1,:),'--','Color',arancione),   hold on
plot(camp,P(2,:),'--','Color',azzurro),     hold on
plot(camp,P(3,:),'--','Color',verde),       hold on
plot(camp,vincoli.Pmax*ones(1,n_camp),'k'), hold on
ylabel('VA'), xlabel('time'), grid
%ylim([-0.5e5 13e5])
legend('Pmpp','P_1','P_2','P_3','Pmax')
hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)
title('Potenza attiva disponibile vs iniettata')
%set(gca,'XTick', 0:2:24)

% Potenza attiva P3 P4 P5
subplot(2,1,2)
plot(camp,Pmpp(4,:),'r'), hold on
plot(camp,P(4,:),'--','Color',rosso),     hold on
plot(camp,P(5,:),'--','Color',viola),     hold on
plot(camp,vincoli.Pmax*ones(1,n_camp),'k'), hold on
ylabel('VA'), xlabel('time'), grid
%ylim([-0.5e5 13e5])
legend('Pmpp','P_4','P_5','Pmax')
hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)
title('Potenza attiva disponibile vs iniettata')
%set(gca,'XTick', 0:2:24)


% Modulo correnti iniettate dagli SDG
plot(camp,J(1,:),'--','Color',arancione),  hold on
plot(camp,J(2,:),'--','Color',azzurro),  hold on
plot(camp,J(3,:),'--','Color',verde),  hold on
plot(camp,J(4,:),'--','Color',rosso),  hold on
plot(camp,J(5,:),'--','Color',viola),  grid
ylabel('A'), xlabel('time')
%ylim([-0.5e1 80])
legend('J_1','J_2','J_3','J_4','J_5')
hline = findobj(gcf, 'type', 'line');
set(hline,'LineWidth',lw)
title('Correnti SDG')







% % Stato ed ingresso in per unit
% Ei_pu  =abs(x_t)/vincoli.Enom;
% Emv_pu =abs(u_t(1,:))/vincoli.Enom;
% 
% 
% f=figure;
% set(f,'position',[left, bottom, width, height]);

% % Modulo tensioni Feeder 1 in per unit
% subplot(2,1,1)
% plot(camp,Ei_pu(1,:),'--','Color',arancione),   hold on
% plot(camp,Ei_pu(2,:),'--','Color',azzurro),   hold on
% plot(camp,Ei_pu(3,:),'--','Color',verde),   hold on
% plot(camp,Ei_pu(4,:),'--','Color',rosso),   hold on
% plot(camp,Ei_pu(5,:),'--','Color',viola),   hold on
% plot(camp,(1-alpha)*ones(1,n_camp),'k'),   hold on
% plot(camp,(1+alpha)*ones(1,n_camp),'k')
% grid,   ylabel('V [p.u.]')  ,    xlabel('time')
% %ylim([0.85 1.25])
% legend('E_1','E_2','E_3','E_4','E_5')
% hline = findobj(gcf, 'type', 'line');
% set(hline,'LineWidth',lw)
% title('Tensioni nodali feeder 1 in p.u.')
% 
% % Modulo tensioni Feeder 2 in per unit
% subplot(2,1,2)
% plot(camp,Ei_pu(6,:),'--','Color',arancione),   hold on
% plot(camp,Ei_pu(7,:),'--','Color',azzurro),   hold on
% plot(camp,Ei_pu(8,:),'--','Color',verde),   hold on
% plot(camp,Ei_pu(9,:),'--','Color',rosso),   hold on
% plot(camp,Ei_pu(10,:),'--','Color',viola),  hold on
% plot(camp,(1-alpha)*ones(1,n_camp),'k'), hold on
% plot(camp,(1+alpha)*ones(1,n_camp),'k'), grid
% ylabel('V [p.u.]'),    xlabel('time')
% %ylim([0.85 1.25])
% legend('E_6','E_7','E_8','E_9','E_{10}')
% hline = findobj(gcf, 'type', 'line');
% set(hline,'LineWidth',lw)
% title('Tensioni nodali feeder 2 in p.u.')
% 
% % Modulo Tensione Emv in per unit
% f=figure;
% set(f,'position',[left, bottom, width, height]);
% plot(camp,Emv_pu,'--','Color',azzurro),           hold on
% plot(camp,(1-beta)*ones(1,n_camp),'k'),           hold on
% plot(camp,(1+beta)*ones(1,n_camp),'k'),  grid
% ylabel('V [p.u]'), xlabel('time')
% %ylim([0.85 1.15])
% hline = findobj(gcf, 'type', 'line');
% set(hline,'LineWidth',lw)
% title('Tensione cabina primaria in p.u.')

% Prif=Pmpp/vincoli.PnSDG;
% Pmax_pu=vincoli.Pmax/vincoli.PnSDG;
% 
% f=figure;
% set(f,'position',[left, bottom, width, height]);
% plot(camp,Prif(1,:),'--','Color',arancione) ,                hold on
% plot(camp,Prif(2,:),'--','Color',azzurro) ,                hold on
% plot(camp,Prif(3,:),'--','Color',verde) ,                hold on
% plot(camp,Prif(4,:),'--','Color',rosso) ,                hold on
% plot(camp,Prif(5,:),'--','Color',viola) ,                hold on
% plot(camp,Pmax_pu*ones(1,n_camp),'k'),             hold on
% plot(camp,ones(1,n_camp),'m'),grid
% ylabel('Watt'), xlabel('time')
% legend('Pmpp_1','Pmpp_2','Pmpp_3','Pmpp_4','Pmpp_5','Pmax','PnSDG')
% set(gca,'XTick', 0:1:24)
% ylim([-0.2 1.2])
% hline = findobj(gcf, 'type', 'line');
% set(hline,'LineWidth',lw)
% title('Potenza disponibile dalla fonte in p.u.')