% O 9 - Interference and Diffraction
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

% Lambda Laser
L = 633e-9;

% Deltas
D1 = 31; % in mm (Slit and Circular Aperture)
D2 = 36; % in mm (Anti-Slit and Cross-Grid)

% Slit 1 (40um) [Positive Direction] [Maxima]
S1_0 = 347.5;
S1_x = 1855 + D1;
S1_y = [391.5 421.5 452.0 483.5 514.5 545.5 577.5 608.5];
S1 = atan2(S1_y - S1_0,S1_x);

% Slit 2 (100um) [Positive Direction] [Maxima]
S2_0 = 348.5;
S2_x = 1682 + D1;
S2_y = [364.0 375.0 385.5 397.0 407.5 418.0 429.0 440.0 450.5 461.0];
S2 = atan2(S2_y - S2_0,S2_x);

% Anti-Slit 1 (230um) [Negative Direction] [Maxima]
AS1_0 = 347.5;
AS1_x = 2414 + D2;
AS1_y = [343.5 337.5 331.0 324.5 318.0 311.5 305.5 298.5 292.0 286.0 ...
    279.0 272.5 266.0 259.5 253.0 246.5 240.0 233.5];
AS1 = atan2(AS1_0 - AS1_y,AS1_x);

% Anti-Slit 2 (124um) [Positive Direction] [Maxima]
AS2_0 = 347.5;
AS2_x = 2414 + D2;
AS2_y = [366.0 379.0 392.0 404.0 416.5 429.0 442.0 454.5 467.0 480.0 ...
    492.0 505.0 517.5];
AS2 = atan2(AS2_y - AS2_0,AS2_x);

% Circular Aperture 1 (150um) [Positive Direction] [Minima]
CA1_0 = 348.0;
CA1_x = 1594 + D1;
CA1_y = [356.0 363.0 370.0 377.0 384.0];
CA1 = atan2(CA1_y - CA1_0,CA1_x);

% Circular Aperture 2 (100um) [Positive Direction] [Minima]
CA2_0 = 347.0;
CA2_x = 1605 + D1;
CA2_y = [359.0 369.5 380.0 390.5 401.0];
CA2 = atan2(CA2_y - CA2_0,CA2_x);

% Cross-Grid 1 (28um) [Negative Direction] [Maxima]
CG1_0 = 348.0;
CG1_x = 1603 + D2;
CG1_y = [294.0 259.0 220.0 185.0];
CG1 = atan2(CG1_0 - CG1_y,CG1_x);

% Cross-Grid 2 (50um) [Negative Direction] [Maxima]
CG2_0 = 347.5;
CG2_x = 2076 + D2;
CG2_y = [280.5 254.0 227.5 200.5 173.5 147.0 120.0 92.5];
CG2 = atan2(CG2_0 - CG2_y,CG2_x);
