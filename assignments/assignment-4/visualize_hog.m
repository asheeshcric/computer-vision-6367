function visualize_hog(ori_histo, im)

    [M,N,cell_size]=size(ori_histo);
    [m,n,p]=size(im);
    [x,y]=meshgrid(5:8:N*8,5:8:M*8);
    temp = ori_histo;

    temp = temp*2;

    phase = -90;
    px = temp(:,:,1)*cosd(phase+0);py = temp(:,:,1)*sind(phase+0);
    q=quiver(x,y,px,py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';
    q=quiver(x,y,-px,-py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';


    px = temp(:,:,2)*cosd(phase+30);py = temp(:,:,2)*sind(phase+30);
    q=quiver(x,y,px,py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';
    q=quiver(x,y,-px,-py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';

    px = temp(:,:,3)*cosd(phase+60);py = temp(:,:,3)*sind(phase+60);
    q=quiver(x,y,px,py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';
    q=quiver(x,y,-px,-py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';

    px = temp(:,:,4)*cosd(phase+90);py = temp(:,:,4)*sind(phase+90);
    q=quiver(x,y,px,py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';
    q=quiver(x,y,-px,-py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';

    px = temp(:,:,5)*cosd(phase+120);py = temp(:,:,5)*sind(phase+120);
    q=quiver(x,y,px,py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';
    q=quiver(x,y,-px,-py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';

    px = temp(:,:,6)*cosd(phase+150);py = temp(:,:,6)*sind(phase+150);
    q=quiver(x,y,px,py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';
    q=quiver(x,y,-px,-py);
    q.Color='r';
    q.LineWidth=2;
    q.ShowArrowHead = 'off';

end
