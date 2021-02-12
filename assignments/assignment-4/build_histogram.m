function ori_histo = build_histogram(grad_mag, grad_ang, cell_size)
    [m, n] = size(grad_mag);
    M = int16(floor(m/cell_size));
    N = int16(floor(n/cell_size));
    ori_histo = zeros(M, N, 6);
  
    
    for i=1:M
        for j=1:N
            for x= cell_size*(i-1)+1:cell_size*i
                for y= cell_size*(j-1)+1:cell_size*j

                    if (grad_ang(x,y)>=0 && grad_ang(x,y)<15)  ||  (grad_ang(x,y)>=165 && grad_ang(x,y)<180)
                        ori_histo(i,j,1)=ori_histo(i,j,1) + grad_mag(x,y);
                    end    
                    if (grad_ang(x,y)>=15)&&(grad_ang(x,y)<45)
                        ori_histo(i,j,2)=ori_histo(i,j,2) + grad_mag(x,y);
                    end
                    if (grad_ang(x,y)>=45) && (grad_ang(x,y)<75)
                        ori_histo(i,j,3)=ori_histo(i,j,3) + grad_mag(x,y);
                    end
                    if (grad_ang(x,y)>=75) && (grad_ang(x,y)<105)
                        ori_histo(i,j,4)=ori_histo(i,j,4) + grad_mag(x,y);
                    end
                    if (grad_ang(x,y)>=105) && (grad_ang(x,y)<135)
                        ori_histo(i,j,5)=ori_histo(i,j,5) + grad_mag(x,y);
                    end
                    if (grad_ang(x,y)>=135) && (grad_ang(x,y)<165)
                        ori_histo(i,j,6)=ori_histo(i,j,6) + grad_mag(x,y);
                    end
                end
            end
        end
    end
end