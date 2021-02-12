% Ashish Jaiswal 
% 1001748734
% Assignment 5 - CSE-6367

clear all;
clc;

% Loading arrays from the file
xs  = load('linefit.mat', 'xs');
n_y1  = load('linefit.mat', 'n_y1');
n_y2  = load('linefit.mat', 'n_y2');

x = xs.xs;
y1 = n_y1.n_y1;
y2 = n_y2.n_y2;
n = size(x, 2);

%% (a) Using the first measurements
Sx  = sum(x);
Sy  = sum(y1);
Sxx = sum(x.*x);
Sxy = sum(x.*y1);

M = [Sxx, Sx; Sx, n];
V = [Sxy; Sy];

W = M\V;
W = W';

disp(num2str(W));

xh = [x; ones(size(x))];
y1_hat = W*xh;

%% (b) Using the second measurements
Sx  = sum(x);
Sy  = sum(y2);
Sxx = sum(x.*x);
Sxy = sum(x.*y2);

M = [Sxx, Sx; Sx, n];
V = [Sxy; Sy];

W = M\V;
W = W';

disp(num2str(W));

xh = [x; ones(size(x))];
y2_hat = W*xh;

%% (c) Applying RANSAC estimation on second measurements
sampleNum = 10; % minimum num of samples for estimation
suffNum = 90;   % sufficient number of samples for final model
numIter = 100;   % num of iterations
thr = 60;  % error threshold

xh = [x; ones(size(x))];

for i = 1 : numIter
    p = randperm(n, sampleNum);
    
    xs = x(1, p);
    ys = y2(1, p);
    
    Sx  = sum(xs);
    Sy  = sum(ys);
    Sxx = sum(xs.*xs);
    Sxy = sum(xs.*ys);

    M = [Sxx, Sx; Sx, n];
    V = [Sxy; Sy];

    W = M\V;
    W = W';
    y_hat = W*xh;
    
    err = abs(y_hat - y2);
    numInlier = sum(err < thr);
    
    if (numInlier > suffNum)
        break;
    end
    
end

% Restimate model with inliers
xr = x;
yr = y2;
for j = 1: n
    if (err(j) > thr)
        xr(j) = [];
        yr(j) = [];
    end
end

Sx  = sum(xr);
Sy  = sum(yr);
Sxx = sum(xr.*xr);
Sxy = sum(xr.*yr);

M = [Sxx, Sx; Sx, n];
V = [Sxy; Sy];

W = M\V;
W = W';

disp(num2str(W));

xrh = [xr; ones(size(xr))];
yr_hat = W*xrh;


% Plotting all the lines %

figure, scatter(x, y2, 'Cyan')
hold on;
line(x, y1_hat, 'Color','black')
line(x, y2_hat, 'Color','red')
line(xr, yr_hat, 'Color','blue')

legend('points', 'Measurements 1', 'Measurements 2', 'RANSAC Estimation')
title('Estimated Lines')
print('lines', '-dpng')