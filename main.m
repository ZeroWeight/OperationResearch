clear;
func = @(x) Performance(x);

[x,fval,exitflag,output,population,score] = Optimize(5,zeros(1,5),30*ones(1,5));