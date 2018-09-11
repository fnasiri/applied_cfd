% HIGH RE BACKWARD FACING STEP.

clear
clc

dns_data_dir='/Users/fnasiri/Desktop/Desktop/post_process/flat_plate_stats/data/no_header/3';
dns_data=load(dns_data_dir);
y_delta_dns=dns_data(:,1); y_plus_dns=dns_data(:,2);
U_dns=dns_data(:,3);

y=y_delta_dns*0.32756; u=U_dns/max(max(U_dns));

u2= (1.004*y.*y.*y.*y.*y-0.3444*y.*y.*y.*y+0.05276*y.*y.*y+0.001819*y.*y+2.71e-5*y)./(y.*y.*y.*y.*y-0.3306*y.*y.*y.*y+0.04225*y.*y.*y+0.004181*y.*y+2.112e-5*y+4.07e-7);

plot(y_delta_dns*0.32756,U_dns/max(max(U_dns)))
hold on
scatter(y,u2)
xlim([0.0 2.5])
