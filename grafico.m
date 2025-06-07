clear all;
close all;
clc;

% Dominio de solucao
% Acley
lb = -32.7680; % lowerbound
ub = 32.7680;  % upperbound
% Rosenbrock
lb = -2.048; % lowerbound
ub = 2.048;  % upperbound

n = 31;       % numero de pontos

x = linspace(lb,ub,n);  % montar vetor x
y = linspace(lb,ub,n);  % montar vetor y
z = zeros(n,n);         % inicializar vetor z

for i=1:n
    for j=1:n
        xx = [x(i) y(j)];
        z(i,j) = rosen(xx);
    end
end

surf(x,y,z)
%shading INTERP
colormap(jet)