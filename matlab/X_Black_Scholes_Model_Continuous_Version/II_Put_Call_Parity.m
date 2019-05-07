%% Black-Scholes formula - Call

clear all; close all; clc;

S=50:5:150; K=100; T=1; r=0.03; v=0.2;

figure(1)

% Plot of call option price
C=Call(S,K,T,r,v); 
plot(S,C); grid on; hold on;

% Plot of call option payoff at maturity
S1=sort([S K]); C1=max(S1-K,0); 
plot(S1,C1,'-r'); 
xlabel('Stock'); ylabel('Call'); legend('Call','Exercise')

%% Black-Scholes formula - Put

figure(2)

% Plot of put option price
P=Put(S,K,T,r,v); 
plot(S,P,'-r'); grid on; hold on;

% Plot of put option payoff at maturity
S1=sort([S K]); P1=max(K-S1,0); 
plot(S1,P1,'-r');
xlabel('Stock'); ylabel('Put'); legend('Put','Exercise')

% Before pause - Compute put price using Black-Scholes formula (red curve)
pause(10)
% After pause - Compute put price using put call parity (blue curve)

% Check - Compute put price using put call parity
P2=C-S+K*exp(-r*T);
plot(S,P2,'-b');