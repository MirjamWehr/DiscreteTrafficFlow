function [ y ] = g( u,epsilon,H )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x = 1/H*u(2,:).*(1-u(1,:)).^H;
y = -1/epsilon*(u(2,:)-H*F(x)./((1-u(1,:)).^H));
end

