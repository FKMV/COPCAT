function [Ke,fe]=beam2t(ex,ey,ep,eq);
% Ke=beam2e(ex,ey,ep)
% [Ke,fe]=beam2e(ex,ey,ep,eq)
%---------------------------------------------------------------------
%    PURPOSE
%     Compute the stiffness matrix for a two dimensional beam element. 
% 
%    INPUT:  ex = [x1 x2]
%            ey = [y1 y2]       element node coordinates
%
%            ep = [E A I]       element properties
%                                  E: Young's modulus
%                                  A: Cross section area
%                                  I: Moment of inertia
%
%            eq = [qx qy]       distributed loads, local directions
% 
%    OUTPUT: Ke : element stiffness matrix (6 x 6)
%
%            fe : element load vector (6 x 1)
%--------------------------------------------------------------------

% LAST MODIFIED: K Persson    1995-08-23
% Copyright (c)  Division of Structural Mechanics and
%                Department of Solid Mechanics.
%                Lund Institute of Technology
%-------------------------------------------------------------
  b=[ ex(2)-ex(1); ey(2)-ey(1) ];
  L=sqrt(b'*b);  n=b/L;

  E=ep(1);  A=ep(2);  I=ep(3); Gm=ep(5); ksf=ep(6); 

  qx=0; qy=0;  if nargin>3; qx=eq(1); qy=eq(2); end
  
  m=(12/L^2)*(E*I/(Gm*A*ksf));

  Kle=E/(1+m)*[A*(1+m)/L    0         0       -A*(1+m)/L   0            0;
                  0      12*I/L^3  6*I/L^2        0      -12*I/L^3   6*I/L^2;
                  0      6*I/L^2  4*I*(1+m/4)/L   0      -6*I/L^2  2*I*(1-m/2)/L;
              -A*(1+m)/L    0         0        A*(1+m)/L    0           0;
                  0     -12*I/L^3  -6*I/L^2       0      12*I/L^3   -6*I/L^2;
                  0      6*I/L^2  2*I*(1-m/2)/L   0      -6*I/L^2   4*I*(1+m/4)/L];
   
  fle=L*[qx/2 qy/2 qy*L/12 qx/2 qy/2 -qy*L/12]';

  G=[n(1) n(2)  0    0    0   0;
    -n(2) n(1)  0    0    0   0;
      0    0    1    0    0   0;
      0    0    0   n(1) n(2) 0;
      0    0    0  -n(2) n(1) 0;
      0    0    0    0    0   1];

  Ke=G'*Kle*G;   fe=G'*fle; 
%--------------------------end--------------------------------
