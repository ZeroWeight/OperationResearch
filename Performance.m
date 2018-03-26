function [ score,P,R,Y ] = Performance( K )
    X = [122e9;29.7e9;10.1e9;3.29e9];
    F = [1;0.2;0.04;0.008] * 1.22e11;
    Y = X;
    P = 0;
    R = 0;
    for i = 1:1:5
        [Y,Z] = nextyear(Y,K(i));
        if min(Y) <0
            score = 0;
            return
        end
        P = P + Z;
    end
    
%% Ratio calc 1
%     Ori = zeros(1,20);
%     New = zeros(1,20);
%     for k = 1:20
%         [~,Ori(k)] = nextyear(F,k);
%         [~,New(k)] = nextyear(Y,k);
%     end
%     ratio = New ./ Ori;

%% Ratio calc 2    
%   ratio = Y ./ F;
    
%% Ratio calc 3
    loop = 5;
    Ori = zeros(1,20);
    New = zeros(1,20);
    for k = 1:20
        FP = zeros(1,loop);
        YP = zeros(1,loop);
        tempFY = F;
        tempY = Y;
        for i = 1:loop
            [tempFY,FP(i)] = nextyear(tempFY,k);
            [tempY,YP(i)] = nextyear(tempY,k);
        end
        Ori(k) = mean(FP);
        New(k) = mean(YP);
    end
    ratio = New ./ Ori;
%% Combination
R = min(ratio);
if R < 0.8
    score = 0;
    return
end
score = - P * 1e-10 * R;
end

