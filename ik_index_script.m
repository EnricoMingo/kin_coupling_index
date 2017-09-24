clear all;
close all;
clc;

%% Robot Loading
%mdl_puma560;
mdl_jaco
robot = jaco;
%%
global h;
global h1;
global h2;
robot.teach(qr, 'callback', @(r,q) call_back(r,q))