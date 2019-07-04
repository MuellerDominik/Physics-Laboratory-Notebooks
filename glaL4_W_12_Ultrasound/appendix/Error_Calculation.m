% W 12 - Ultrasound (Error Calculation)
% Dominik Mueller - 24.05.2019
clear all; clc
format shorteng

% Used Symbolic Varibles
syms x t s_c_stat

% Syst. Uncertainties
s_x = 0.01e-3;
s_t = 0.1e-6;
s_p = 0.05;

% c Uncertainty
% -------------
c(x,t) = 2.*x./t;
c_x(x,t) = simplify(diff(c(x,t),x,1));
c_t(x,t) = simplify(diff(c(x,t),t,1));
s_c_syst(x,t) = sqrt((c_x(x,t).*s_x).^2 + (c_t(x,t).*s_t).^2);
s_c_tot(x,t,s_c_stat) = sqrt(s_c_syst(x,t).^2 + s_c_stat.^2);

% PMMA 1 MHz
x = 20.4e-3;
t = 14.878e-6;
s_c_stat = 4.764007;                                  % STAT (from QtiPlot)
s_PMMA_1_syst = s_c_syst(x,t);                        % SYST
s_PMMA_1_syst_double = double(s_PMMA_1_syst)
s_PMMA_1_tot = s_c_tot(x,t,s_c_stat);                 % TOT
s_PMMA_1_tot_double = double(s_PMMA_1_tot)

% PMMA 5 MHz
t = 14.903e-6;
s_c_stat = 9.845065;                                  % STAT (from QtiPlot)
s_PMMA_5_syst = s_c_syst(x,t);                        % SYST
s_PMMA_5_syst_double = double(s_PMMA_5_syst)
s_PMMA_5_tot = s_c_tot(x,t,s_c_stat);                 % TOT
s_PMMA_5_tot_double = double(s_PMMA_5_tot)

% Aluminium 5 MHz
x = 40.03e-3;
t = 12.583e-6;
s_c_stat = 30.18595;                                  % STAT (from QtiPlot)
s_Aluminium_5_syst = s_c_syst(x,t);                   % SYST
s_Aluminium_5_syst_double = double(s_Aluminium_5_syst)
s_Aluminium_5_tot = s_c_tot(x,t,s_c_stat);            % TOT
s_Aluminium_5_tot_double = double(s_Aluminium_5_tot)

% Copper 5 MHz
x = 40.05e-3;
t = 12.583e-6;
s_c_stat = 16.88886;                                  % STAT (from QtiPlot)
s_Copper_5_syst = s_c_syst(x,t);                      % SYST
s_Copper_5_syst_double = double(s_Copper_5_syst)
s_Copper_5_tot = s_c_tot(x,t,s_c_stat);               % TOT
s_Copper_5_tot_double = double(s_Copper_5_tot)

% Brass 5 MHz
x = 40.06e-3;
t = 18.041e-6;
s_c_stat = 45.68923;                                  % STAT (from QtiPlot)
s_Brass_5_syst = s_c_syst(x,t);                       % SYST
s_Brass_5_syst_double = double(s_Brass_5_syst)
s_Brass_5_tot = s_c_tot(x,t,s_c_stat);                % TOT
s_Brass_5_tot_double = double(s_Brass_5_tot)

% Water 21 C
x = 20e-3;
t = 25.200e-6;
s_c_stat = 2.846528;                                  % STAT (from QtiPlot)
s_Water21_5_syst = s_c_syst(x,t);                     % SYST
s_Water21_5_syst_double = double(s_Water21_5_syst)
s_Water21_5_tot = s_c_tot(x,t,s_c_stat);              % TOT
s_Water21_5_tot_double = double(s_Water21_5_tot)

% Water 49 C
t = 24.148e-6;
s_c_stat = 4.719283;                                  % STAT (from QtiPlot)
s_Water49_5_syst = s_c_syst(x,t);                     % SYST
s_Water49_5_syst_double = double(s_Water49_5_syst)
s_Water49_5_tot = s_c_tot(x,t,s_c_stat);              % TOT
s_Water49_5_tot_double = double(s_Water49_5_tot)

% Saltwater 40 C
t = 22.682e-6;
s_c_stat = 5.889367;                                  % STAT (from QtiPlot)
s_Saltwater_5_syst = s_c_syst(x,t);                   % SYST
s_Saltwater_5_syst_double = double(s_Saltwater_5_syst)
s_Saltwater_5_tot = s_c_tot(x,t,s_c_stat);            % TOT
s_Saltwater_5_tot_double = double(s_Saltwater_5_tot)

% PMMA Transversal 1 MHz
x = 20.4e-3;
t = 28.533e-6;
s_c_stat = 14.25599;                                  % STAT (from QtiPlot)
s_PMMA_T_1_syst = s_c_syst(x,t);                      % SYST
s_PMMA_T_1_syst_double = double(s_PMMA_T_1_syst)
s_PMMA_T_1_tot = s_c_tot(x,t,s_c_stat);               % TOT
s_PMMA_T_1_tot_double = double(s_PMMA_T_1_tot)

%% ------------------------------------------------------------------------

% Used Symbolic Varibles
syms x p p0 s_mu_stat

% Syst. Uncertainties
% Defined at the beginning of this script

% mu Uncertainty
% --------------
mu(x,p,p0) = -log(p./p0)./x;
mu_x(x,p,p0) = simplify(diff(mu(x,p,p0),x,1));
mu_p(x,p,p0) = simplify(diff(mu(x,p,p0),p,1));
mu_p0(x,p,p0) = simplify(diff(mu(x,p,p0),p0,1));
s_mu_syst(x,p,p0) = sqrt((mu_x(x,p,p0).*s_x).^2 + ...
    (mu_p(x,p,p0).*s_p).^2 + (mu_p0(x,p,p0).*s_p).^2);
s_mu_tot(x,p,p0,s_mu_stat) = sqrt(s_mu_syst(x,p,p0).^2 + s_mu_stat.^2);

% Attenuation PMMA 1 MHz
x = 20.4e-3;
p = 1.09;
p0 = 2.02;
s_mu_stat = 6.967746e-1;                              % STAT (from QtiPlot)
s_PMMA_ATT_1_syst = s_mu_syst(x,p,p0);                % SYST
s_PMMA_ATT_1_syst_double = double(s_PMMA_ATT_1_syst)
s_PMMA_ATT_1_tot = s_mu_tot(x,p,p0,s_mu_stat);        % TOT
s_PMMA_ATTT_1_tot_double = double(s_PMMA_ATT_1_tot)

% Attenuation PMMA 5 MHz
p = 0.43;
p0 = 2.39;
s_mu_stat = 2.545431;                                 % STAT (from QtiPlot)
s_PMMA_ATT_5_syst = s_mu_syst(x,p,p0);                % SYST
s_PMMA_ATT_5_syst_double = double(s_PMMA_ATT_5_syst)
s_PMMA_ATT_5_tot = s_mu_tot(x,p,p0,s_mu_stat);        % TOT
s_PMMA_ATTT_5_tot_double = double(s_PMMA_ATT_5_tot)

