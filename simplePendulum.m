function [x] = simplePendulum(t,x0,m,b,k)
A = [0 1; -k/m -b/m];

x = A*x0;
end