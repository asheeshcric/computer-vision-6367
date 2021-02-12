function [Q] = find_intersection(P11, P12, P21, P22)
    Q11 = project_point(P11);
    Q12 = project_point(P12);
    Q21 = project_point(P21);
    Q22 = project_point(P22);
    
    v1 = Q12 - Q11;
    v2 = Q22 - Q21;
    u = Q21 - Q11;
    
    t = cross(u, v2) / cross(v1, v2);
    s = cross(u, v1) / cross(v1, v2);
    
    Q = Q11 + t*v1;
end