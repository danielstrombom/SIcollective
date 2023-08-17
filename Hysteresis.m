function [t,xa]=Hysteresis(g,r)

%Function to investigate hysteresis effects resulting from changing the
%collective cooperation threshold T over time in the ODE system

% g*(1-C)*I*(1-I)-r*I
% C*(1-C)*(I-T)

%Variables and parameters
% I=I(t) proportion infected at time t (x(1) below).
% C=C(t) proportion cooperating at time t. (x(2) below).
% T=T(t) collective cooperation threshold as function of time. (x(3) below).
% g=constant disease transmission rate. To reproduce Figure 4 use g=0.2;
% r=constant recovery rate. To reproduce Figure 4 use r=1/14;

%FORWARD (T increase from 0 to 1)
f = @(t,x) [g*(1-x(2))*x(1)*(1-x(1))-r*x(1);x(2)*(1-x(2))*(x(1)-x(3));0.0001];
[t,xa] = ode45(f,[0 10000],[0.01 0.01 0]);

tF=t;
xaF=xa; %Store Forward result xaF=[x(1),x(2),x(3)] 

%Store final I and C values from Forward to be used as initial for
%Backward.
sxaF=size(xaF,1);
iI=xaF(sxaF,1);
iC=xaF(sxaF,2);

%BACKWARD (T decrease from 1 to 0 with initial conditions iI and iC from end of Forward.)
f = @(t,x) [g*(1-x(2))*x(1)*(1-x(1))-r*x(1);x(2)*(1-x(2))*(x(1)-x(3));-0.0001];
[t,xa] = ode45(f,[0 10000],[iI iC 1]);

tB=t;
xaB=xa; %Store Backward result xaF=[x(1),x(2),x(3)] 

%PLOT
plot(tF,xaF(:,1),'-r')
hold on
plot(wrev(tB),xaB(:,1),'.r')
hold on
plot(tF,xaF(:,2),'-b')
hold on
plot(wrev(tB),xaB(:,2),'.b')
xlabel('Threshold (T)')
xticks([0 2500 5000 7500 10000])
xticklabels({'0','0.25','0.5','0.75','1'})
ylabel('Proportion')
ylim([0 1])
