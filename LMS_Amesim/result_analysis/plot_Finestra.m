function [] = plot_Finestra( x0,xF,y0,yF,yLb,yUb, lw )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%rectangle('Position',[x0 y0 xF-x0 yF-y0],'FaceColor',gia,'LineWidth',lw)
%rectangle('Position',[v.Dmin_L v.Xmin_L v.Dmax_L-v.Dmin_L v.Xmax_L-v.Xmin_L],'FaceColor',[0 .5 .5])

plot(x0*[1 1],[yLb yUb],'k'),   hold on

plot(xF*[1 1],[yLb yUb],'k'),   hold on

patch([x0, xF, xF, x0], ...
      [y0, y0, yF, yF],'red','FaceAlpha',.5,'LineWidth',lw);
  


end

