clc;
clear all;
a=-1; b=1;
x= a + (b-a).*rand(100000,2);
A = [2 1; 1 2];
k = 1
for i=1:100000
    if norm(x(i, :)) <= 1
        a(k) = x(i, 1);
        b(k) = x(i, 2);
        X(:,k) = A*[x(i, 1); x(i, 2)];
        k=k+1;
    end
end

figure();
plot(X(1,:),X(2,:),'*')


clear all;
A = [2 1; 1 2];
a=0; b=10;
for i=1:10000
    theta = a + (b-a).*rand(1,1);
    x = [sin(theta); cos(theta)];
    if norm(x) <= 1
        X(:,i) = A*x;
    end
end
figure();
plot(X(1,:),X(2,:),'*')   