function [fitresult, gof] = createSolarFit(my_delT, my_AvgRelHum, my_SolRatio)
%CREATEFIT(MY_DELT,MY_AVGRELHUM,MY_SOLRATIO)
%  Create a fit.
%
%  Data for 'untitled fit 1 copy 1' fit:
%      X Input: my_delT
%      Y Input: my_AvgRelHum
%      Z Output: my_SolRatio
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 20-Mar-2025 10:32:11


%% Fit: 'untitled fit 1 copy 1'.
[xData, yData, zData] = prepareSurfaceData( my_delT, my_AvgRelHum, my_SolRatio );

% Set up fittype and options.
ft = fittype( 'a*(1-b*H)*(1-exp(-c*(delT)^n))', 'independent', {'delT', 'H'}, 'dependent', 'z' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.757740130578333 0.743132468124916 0.392227019534168 0.706046088019609];

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1 copy 1' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'untitled fit 1 copy 1', 'my_SolRatio vs. my_delT, my_AvgRelHum', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'my_delT', 'Interpreter', 'none' );
ylabel( 'my_AvgRelHum', 'Interpreter', 'none' );
zlabel( 'my_SolRatio', 'Interpreter', 'none' );
grid on


