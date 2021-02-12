function [] = plot_home2D(W)

    W = W';
    step = 10;
    
    B1 = W(1,:);
    B2 = W(2,:);
    B3 = W(3,:);
    B4 = W(4,:);
    U1 = W(5,:);
    U2 = W(6,:);
    U3 = W(7,:);
    U4 = W(8,:);
    T1 = W(9,:);
    T2 = W(10,:);
    
    LB1X = [B1(1), B2(1)];
    LB1Y = [B1(2), B2(2)];
    LB2X = [B2(1), B3(1)];
    LB2Y = [B2(2), B3(2)];
    LB3X = [B3(1), B4(1)];
    LB3Y = [B3(2), B4(2)];
    LB4X = [B4(1), B1(1)];
    LB4Y = [B4(2), B1(2)];
    
    LU1X = [U1(1), U2(1)];
    LU1Y = [U1(2), U2(2)];
    LU2X = [U2(1), U3(1)];
    LU2Y = [U2(2), U3(2)];
    LU3X = [U3(1), U4(1)];
    LU3Y = [U3(2), U4(2)];
    LU4X = [U4(1), U1(1)];
    LU4Y = [U4(2), U1(2)];
    
    LV1X = [B1(1), U1(1)];
    LV1Y = [B1(2), U1(2)];
    LV2X = [B2(1), U2(1)];
    LV2Y = [B2(2), U2(2)];
    LV3X = [B3(1), U3(1)];
    LV3Y = [B3(2), U3(2)];
    LV4X = [B4(1), U4(1)];
    LV4Y = [B4(2), U4(2)];
    
    LR1X = [U1(1), T1(1)];
    LR1Y = [U1(2), T1(2)];
    LR2X = [U2(1), T1(1)];
    LR2Y = [U2(2), T1(2)];
    LR3X = [U3(1), T2(1)];
    LR3Y = [U3(2), T2(2)];
    LR4X = [U4(1), T2(1)];
    LR4Y = [U4(2), T2(2)];
    LR5X = [T1(1), T2(1)];
    LR5Y = [T1(2), T2(2)];
    
    figure, 
    hold on
    line(LB1X, LB1Y, 'color', 'red')
    line(LB2X, LB2Y, 'color', 'red')
    line(LB3X, LB3Y, 'color', 'red')
    line(LB4X, LB4Y, 'color', 'red')
    
    line(LU1X, LU1Y, 'color', 'green')
    line(LU2X, LU2Y, 'color', 'green')
    line(LU3X, LU3Y, 'color', 'green')
    line(LU4X, LU4Y, 'color', 'green')
    
    line(LV1X, LV1Y, 'color', 'blue')
    line(LV2X, LV2Y, 'color', 'blue')
    line(LV3X, LV3Y, 'color', 'blue')
    line(LV4X, LV4Y, 'color', 'blue')
    
    line(LR1X, LR1Y, 'color', 'black')
    line(LR2X, LR2Y, 'color', 'black')
    line(LR3X, LR3Y, 'color', 'black')
    line(LR4X, LR4Y, 'color', 'black')
    line(LR5X, LR5Y, 'color', 'black')
end

