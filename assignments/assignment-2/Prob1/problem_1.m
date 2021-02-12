clear all;
clc;

P11 = [-1, -1, 2];
P12 = [-1, -1, 3];
P21 = [0, -1, 2];
P22 = [0, -1, 3];
P31 = [1, -1, 2];
P32 = [1, -1, 3];

Q11 = project_point(P11)
Q12 = project_point(P12)
Q21 = project_point(P21)
Q22 = project_point(P22)
Q31 = project_point(P31)
Q32 = project_point(P32)

%% (b)
t = 5;
L1 = [P11-t*(P12-P11); P11+t*(P12-P11)];
L2 = [P21-t*(P22-P21); P21+t*(P22-P21)];
L3 = [P31-t*(P32-P31); P31+t*(P32-P31)];

%LL1 = [Q11; Q12];
LL1 = [Q11-t*(Q12-Q11); Q11+t*(Q12-Q11)];
LL2 = [Q21-t*(Q22-Q21); Q21+t*(Q22-Q21)];
LL3 = [Q31-t*(Q32-Q31); Q31+t*(Q32-Q31)];

figure,
plot3(L1(:,1), L1(:,2), L1(:,3), 'r')
title('1 (b) find intersection plot for lines L1 & L2')
hold on
plot3(L2(:,1), L2(:,2), L2(:,3), 'r')
plot3(L3(:,1), L3(:,2), L3(:,3), 'r')
plot3(LL1(:,1), LL1(:,2), LL1(:,3), 'b')
plot3(LL2(:,1), LL2(:,2), LL2(:,3), 'b')
plot3(LL3(:,1), LL3(:,2), LL3(:,3), 'b')
hold off
print('plt_1', '-dpng')

%% (c)
Q1 = find_intersection(P11, P12, P21, P22)
Q2 = find_intersection(P11, P12, P31, P32)
Q3 = find_intersection(P21, P22, P31, P32)

%% (d)
[QQ1, QQ2, QQ3] = pairwise_intersection()
cross(QQ2-QQ1, QQ3-QQ1)