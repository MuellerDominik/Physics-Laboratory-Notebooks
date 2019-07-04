% O 9 - Interference and Diffraction (Error Calculation)
% Dominik Mueller
clear all; clc
format shorteng

% Bessel Function Zeros J_1(x*pi)
% Necessary for Circular Apertures
syms x
z = 2.*besselj(1,x.*pi)./(x.*pi);
c = zeros(1,5);
for i = 1:5
    c(i) = vpasolve(z == 0,x,i);
end
clear x z i

% Used Symbolic Varibles
syms x y m l p

% Lambda Laser
L = 633e-9;

% Deltas
D1 = 31./1e3; % in m (Slit and Circular Aperture)
D2 = 36./1e3; % in m (Anti-Slit and Cross-Grid)

% Syst. Uncertainties
s_x = 1./1e3;
s_y = 1./1e3;

% Phi Uncertainty
phi(x,y) = atan(y./x);
phi_x(x,y) = diff(phi(x,y),x,1);
phi_y(x,y) = diff(phi(x,y),y,1);
s_phi(x,y) = sqrt((phi_x(x,y).*s_x).^2 + (phi_y(x,y).*s_y).^2);

% Error Propagation Slit and Anti-Slit
% ------------------------------------
w(m,l,p) = (m + 0.5).*l./sin(p);
w_p(m,l,p) = diff(w(m,l,p),p,1);

% Slit 40um (@ m = 1)
X1 = 1.855 + D1;
Y1 = (391.5 - 347.5)./1e3;
P1 = atan2(Y1,X1);
s1_w_STAT = 1.044057e-07;                       % STAT (from QtiPlot)

s1_w_SYST = w_p(1,L,P1).*s_phi(X1,Y1);          % SYST
s1_w_TOT = sqrt(s1_w_STAT.^2 + s1_w_SYST.^2);   % TOT
s1_w_TOT_double = double(s1_w_TOT)

% Slit 100um (@ m = 1)
X2 = 1.682 + D1;
Y2 = (364.0 - 348.5)./1e3;
P2 = atan2(Y2,X2);
s2_w_STAT = 1.434605e-07;                       % STAT (from QtiPlot)

s2_w_SYST = w_p(1,L,P2).*s_phi(X2,Y2);          % SYST
s2_w_TOT = sqrt(s2_w_STAT.^2 + s2_w_SYST.^2);   % TOT
s2_w_TOT_double = double(s2_w_TOT)

% Anti-Slit 230um (@ m = 6)
X3 = 2.414 + D2;
Y3 = (347.5 - 311.5)./1e3;
P3 = atan2(Y3,X3);
s3_w_STAT = 3.410962e-07;                       % STAT (from QtiPlot)

s3_w_SYST = 3.*w_p(6,L,P3).*s_phi(X3,Y3);       % SYST
s3_w_TOT = sqrt(s3_w_STAT.^2 + s3_w_SYST.^2);   % TOT
s3_w_TOT_double = double(s3_w_TOT)

% Anti-Slit 124um (@ m = 1)
X4 = 2.414 + D2;
Y4 = (366.0 - 347.5)./1e3;
P4 = atan2(Y4,X4);
s4_w_STAT = 7.911049e-08;                       % STAT (from QtiPlot)

s4_w_SYST = w_p(1,L,P4).*s_phi(X4,Y4);          % SYST
s4_w_TOT = sqrt(s4_w_STAT.^2 + s4_w_SYST.^2);   % TOT
s4_w_TOT_double = double(s4_w_TOT)

% Error Propagation Circular Aperture
% -----------------------------------
d(l,p) = c(2).*l./sin(p);                       % Default: c = 2
d_p(l,p) = diff(d(l,p),p,1);

% 150um (@ c = 2)
X5 = 1.594 + D1;
Y5 = (363.0 - 348.0)./1e3;
P5 = atan2(Y5,X5);
s5_d_STAT = 8.281002e-07;                       % STAT (from QtiPlot)

s5_d_SYST = d_p(L,P5).*s_phi(X5,Y5);            % SYST
s5_d_TOT = sqrt(s5_d_STAT.^2 + s5_d_SYST.^2);   % TOT
s5_d_TOT_double = double(s5_d_TOT)

% 100um (@ c = 2)
X6 = 1.605 + D1;
Y6 = (369.5 - 347.0)./1e3;
P6 = atan2(Y6,X6);
s6_d_STAT = 5.526927e-07;                       % STAT (from QtiPlot)

s6_d_SYST = d_p(L,P6).*s_phi(X6,Y6);            % SYST
s6_d_TOT = sqrt(s6_d_STAT.^2 + s6_d_SYST.^2);   % TOT
s6_d_TOT_double = double(s6_d_TOT)

% Error Propagation Cross-Grid
% ----------------------------
g(m,l,p) = m.*l./sin(p);
g_p(m,l,p) = diff(g(m,l,p),p,1);

% 28um (@ m = 1)
X7 = 1.603 + D2;
Y7 = (348.0 - 294.0)./1e3;
P7 = atan2(Y7,X7);
s7_g_STAT = 4.439708e-07;                       % STAT (from QtiPlot)

s7_g_SYST = g_p(1,L,P7).*s_phi(X7,Y7);          % SYST
s7_g_TOT = sqrt(s7_g_STAT.^2 + s7_g_SYST.^2);   % TOT
s7_g_TOT_double = double(s7_g_TOT)

% 50um (@ m = 1)
X8 = 2.076 + D2;
Y8 = (347.5 - 280.5)./1e3;
P8 = atan2(Y8,X8);
s8_g_STAT = 5.683660e-08;                       % STAT (from QtiPlot)

s8_g_SYST = g_p(1,L,P8).*s_phi(X8,Y8);          % SYST
s8_g_TOT = sqrt(s8_g_STAT.^2 + s8_g_SYST.^2);   % TOT
s8_g_TOT_double = double(s8_g_TOT)
