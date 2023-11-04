% Solving Ordinary Differential Equations using the ode45 solver
% Manjul Regmi

clc; clear; close all;

% % Simple Pendulum
% m = 10;
% b = 0.1;
% k = 100;
% t_span = [0 5];
% x0 = [1 0];
% [t,x] = ode45(@(t,x)simplePendulum(t,x,m,b,k), t_span, x0);
% 
% figure
% plot(t,x)
% clear;

% Solve Lyapunov equation
A = [0 1; -1 -1];
n = length(A);
Q = [1 0; 0 1];
S_T = [1 0; 0 1];
T = 10;

% ode45 can only integrate vectors and can't integrate matrices.
% Convert final state S matrix to vector
% Since S(1,2) and S(2,1) are same. We can use only one of them.

Sv_T = [S_T(1,1); S_T(1,2); S_T(2,2)];
[t, Sv] = ode45(@(t,S)Lyapunov(t,S,A,Q), [T 0], Sv_T);

% Flipping the time-span in ode45 does integrate the equation backwards but
% the time and vector will also be in that order T to 0.
% So flip the vectors to arrange it forward in time
t = flipud(t);
Sv = flipud(Sv);

% Convert the vectors to matrices
S = zeros(n,n,length(t));
for i = 1:length(t)
    S(1,1,i) = Sv(i,1);
    S(1,2,i) = Sv(i,2);
    S(2,1,i) = Sv(i,2);
    S(2,2,i) = Sv(i,3);
end

