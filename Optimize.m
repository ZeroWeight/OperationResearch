function [x,fval,exitflag,output,population,score] = Optimize(nvars,lb,ub)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = gaoptimset;
%% Modify options setting
options = gaoptimset(options,'Display', 'iter');
options = gaoptimset(options,'PlotFcns', {  @gaplotbestf @gaplotbestindiv @gaplotscores });
[x,fval,exitflag,output,population,score] = ...
ga(@(x)Performance(x),nvars,[],[],[],[],lb,ub,[],[],options);
