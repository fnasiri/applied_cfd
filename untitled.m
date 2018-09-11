% HIGH RE BACKWARD FACING STEP.

clear
clc

dns_data_dir='/Users/fnasiri/Desktop/Desktop/post_process/flat_plate_stats/data/no_header/3';
dns_data=load(dns_data_dir);
y_delta_dns=dns_data(:,1); y_plus_dns=dns_data(:,2);
U_dns=dns_data(:,3);
v_dns=dns_data(:,14);

y=y_delta_dns*0.32756; u=U_dns/max(max(U_dns));
ut=1/max(max(U_dns));


u2= (1.004*y.*y.*y.*y.*y-0.3444*y.*y.*y.*y+0.05276*y.*y.*y+0.001819*y.*y+2.71e-5*y)./(y.*y.*y.*y.*y-0.3306*y.*y.*y.*y+0.04225*y.*y.*y+0.004181*y.*y+2.112e-5*y+4.07e-7);

figure(1)
set(figure(1),'Color',[1.0 1.0 1.0]);
plot(y_delta_dns*0.32756,U_dns/max(max(U_dns)),'k','LineWidth', 2.0)
hold on
%plot(y_delta_dns*0.32756,v_dns*ut)
% scatter(y,u2)
xlim([0.0 1])
set(gca,'fontsize',18)
set(gca,'ticklength',4*get(gca,'ticklength'))
xlabel('$y/\delta$','Interpreter','latex','FontSize',22,'fontWeight','bold')
ylabel('$U/U_\infty$','Interpreter','latex','FontSize',22,'fontWeight','bold','Rotation',90)
