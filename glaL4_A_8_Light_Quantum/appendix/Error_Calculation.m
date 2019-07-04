% A 8 - Light Quantum (Error Calculation)
% Dominik Mueller - 07.06.2019
clear all; clc
format shorteng

% Used Symbolic Varibles
syms U l s_U s_l s_h_stat

% Constants
% h = 6.62607015e-34;
e = 1.602176634e-19;
c = 299792458;

% Calculated Planck constants
direct = 2.647531e-15.*e
counter = 3.393650e-15.*e
LED = 4.780613e-15.*e

% h Uncertainty
% -------------
h(U,l) = e.*U.*l./c;
h_U(U,l) = simplify(diff(h(U,l),U,1));
h_l(U,l) = simplify(diff(h(U,l),l,1));
s_h_syst(U,l,s_U,s_l) = sqrt((h_U(U,l).*s_U).^2 + (h_l(U,l).*s_l).^2);
s_h_tot(U,l,s_U,s_l,s_h_stat) = ...
    sqrt(s_h_syst(U,l,s_U,s_l).^2 + s_h_stat.^2);

% Syst. Uncertainties
s_U = 6e-3;
s_l = 0;

% Photoelectric Effect: Direct Measurement
U = 1.343;
l = 365.4e-9;
s_h_stat = 8.689173e-17.*e;                           % STAT (from QtiPlot)
s_direct_syst = s_h_syst(U,l,s_U,s_l);                % SYST
s_direct_syst_double = double(s_direct_syst)
s_direct_tot = s_h_tot(U,l,s_U,s_l,s_h_stat);         % TOT
s_direct_tot_double = double(s_direct_tot)

% Photoelectric Effect: Counter-Field Method
U = 1.481930;
s_h_stat = 3.196543e-16.*e;                           % STAT (from QtiPlot)
s_counter_syst = s_h_syst(U,l,s_U,s_l);               % SYST
s_counter_syst_double = double(s_counter_syst)
s_counter_tot = s_h_tot(U,l,s_U,s_l,s_h_stat);        % TOT
s_counter_tot_double = double(s_counter_tot)

% Syst. Uncertainties
s_U = 0.02;
s_l = 1e-9;

% Light-Emitting Diode: Threshold Voltage
U = 2.66;
l = 465.1e-9;
s_h_stat = 6.431872e-16.*e;                           % STAT (from QtiPlot)
s_LED_syst = s_h_syst(U,l,s_U,s_l);                   % SYST
s_LED_syst_double = double(s_LED_syst)
s_LED_tot = s_h_tot(U,l,s_U,s_l,s_h_stat);            % TOT
s_LED_tot_double = double(s_LED_tot)
