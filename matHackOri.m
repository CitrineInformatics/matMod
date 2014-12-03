function [ H, t ] = matHackOri( N, r, V )
%This function demonstrates the use of a less condensed grid in reciprocal 
%space, outside of the region of interest in Density Functional Theory
%calculations
%   inputs:
%       N       even integer number
%       V       potential as a function of r
%       r       linear space
%   outputs:
%       H       output hamiltonian matrix
%       t       time of computation
tic
G=-N/2:N/2; gl=length(G);
H = diag(0.5*G.^2);
Vint=zeros(gl);
for i=1:gl-1
    for j=1:gl-1
        Vint(i,j)=trapz(r,V.*exp(1i*(G(j)-G(i))*r));        
    end
end
H=H+Vint;
t=toc;
end

