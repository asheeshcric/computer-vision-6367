k = sqrt(3)/2;
R = [k -0.5 0; 0.5 k 0; 0 0 1];
[A, theta] = get_axisangle(R)


function [A, theta] = get_axisangle(R)

[u, v] = eig(R);
A = u(:,3);
theta = acos((trace(R)-1)/2);

end