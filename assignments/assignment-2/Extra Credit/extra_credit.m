clear all;
clc;

W = [-1, -0.5, -1;
     -1,  0.5, -1;
      1,  0.5, -1;
      1, -0.5, -1;
     -1, -0.5,  1;
     -1,  0.5,  1;
      1,  0.5,  1;
      1, -0.5,  1;
     -1,  0  ,  1.5;
      1,  0  ,  1.5];
  
R1 = [1, 0, 0; 0, 1, 0; 0, 0, 1];
T1 = [10; 10; 0];
C1 = project_points(W, R1, T1);
plot_home2D(C1);
title('(i) [10, 10, 0]');

R2 = [1, 0, 0; 0, 1, 0; 0, 0, 1];
T2 = [-10; 10; 0];
C2 = project_points(W, R2, T2);
plot_home2D(C2);
title('(ii) [-10, 10, 0]');

R3 = [1, 0, 0; 0, 1, 0; 0, 0, 1];
T3 = [0; 0; 10];
C3 = project_points(W, R3, T3);
plot_home2D(C3);
title('(iii) [0, 0, 10]');

R4 = [1, 0, 0; 0, 1, 0; 0, 0, 1];
T4 = [10; 0; 0];
C4 = project_points(W, R4, T4);
plot_home2D(C4);
title('(iv) [10, 0, 0]');


R5 = [1, 0, 0; 0, 1, 0; 0, 0, 1];
T5 = [10; 10; 10];
C5 = project_points(W, R5, T5);
plot_home2D(C5);
title('(v) [10, 10, 10]');