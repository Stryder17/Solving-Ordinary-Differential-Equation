% Solving Ordinary Differential Equations using the ode45 solver
% Manjul Regmi

clc; clear; close all;

% [t,x] = ode45(@(t,x) 2*t, [0 1], 0);
% 
% figure
% plot(t,x)
% clear;

% Simple Pendulum
m = 10;
b = 0.1;
k = 100;
[t,x] = ode45(@(t,x)simplePendulum(t,x,m,b,k), [0 5], [1,0]);

figure
plot(t,x)
clear;

% Solve Ricatti equation
% A = [0 1; -1 -1];
% Q = [1 0; 0 1];
% S_T = [1 0; 0 1];
% T = 10;
% 
% [t, S] = ode45(@solveLyapunov , [0 T], S_T, A, Q);

