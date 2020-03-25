%% Setting up Environment
clc; clear all; close all;
which = 1:10
graph = 1
leg = {};

%% instructions:
%   models holds the different polynomial combinations you can 
%   use for the linear regression analysis. 1:3 will do models
%   for the following equations:
%       Ax + B
%       Ax^2 + Bx + C
%       Ax^3 + Bx^2 +Cx + D
%   [1 3] will create the models for the following equations:
%       Ax + B
%       0x^2 + 0x + 0
%       Ax^3 + Bx^2 +Cx + D
models = [1:7];



%% Establishing Variables
price = readmatrix("../data/train.csv");
t = price(:,1)';
t = t-42843;
price = price(:,3)';
%t = flip(t);

if graph == 1
    plot(t,price); grid
    leg{length(leg)+1} = "data";
    hold on;
end

%% Executing:

funy = zeros(max(models),max(models)+1);
r2 = zeros(length(models),1);
for model = models
    [funy(model,end-model:end),r2(model)] = polyReg(model,t,price);
    leg{length(leg)+1} = num2str(model);
end
x = zeros(length(t),max(models)+1);
for i = 0:max(models)
    x(:,end-i) = t.^i;
end

disp(funy);

out = x*funy';
if graph == 1
    plot(t,out);
end
%% Comparing

legend(leg)





