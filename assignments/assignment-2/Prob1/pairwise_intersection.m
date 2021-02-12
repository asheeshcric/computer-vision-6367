function [Q1, Q2, Q3] = pairwise_intersection()
    P111 = [1, -1, -1];
    P112 = [1, -1, 1];
    
    P121 = [0, -1 ,-1];
    P122 = [0, -1 ,1];

    P211 = [3, -1 ,-4];
    P212 = [-1, -1, 2];

    P221 = [4, -1 ,-5];
    P222 = [0, -1 ,1];

    P311 = [1, -1, 2];
    P312 = [3, -1, 7];

    P321 = [0, -1 ,-1];
    P322 = [2, -1 ,4];

    Q111 = project_point(P111);
    Q112 = project_point(P112);

    Q121 = project_point(P121);
    Q122 = project_point(P122);

    Q211 = project_point(P211);
    Q212 = project_point(P212);

    Q221 = project_point(P221);
    Q222 = project_point(P222);

    Q311 = project_point(P311);
    Q312 = project_point(P312);

    Q321 = project_point(P321);
    Q322 = project_point(P322);
    
    Q1 = find_intersection(Q111, Q112, Q121, Q122);
    Q2 = find_intersection(Q211, Q212, Q221, Q222);
    Q3 = find_intersection(Q311, Q312, Q321, Q322);
    
    t = 5;
    L11 = [P111-t*(P112-P111); P111+t*(P112-P111)];
    L12 = [P121-t*(P122-P121); P121+t*(P122-P121)];

    L21 = [P211-t*(P212-P211); P211+t*(P212-P211)];
    L22 = [P221-t*(P222-P221); P221+t*(P222-P221)];

    L31 = [P311-t*(P312-P311); P311+t*(P312-P311)];
    L32 = [P321-t*(P322-P321); P321+t*(P322-P321)];

    LL11 = [Q111-t*(Q112-Q111); Q111+t*(Q112-Q111)];
    LL12 = [Q121-t*(Q122-Q121); Q121+t*(Q122-Q121)];

    LL21 = [Q211-t*(Q212-Q211); Q211+t*(Q212-Q211)];
    LL22 = [Q221-t*(Q222-Q221); Q221+t*(Q222-Q221)];

    LL31 = [Q311-t*(Q312-Q311); Q311+t*(Q312-Q311)];
    LL32 = [Q321-t*(Q322-Q321); Q321+t*(Q322-Q321)];
    
    
    figure,
    plot3(L11(:,1), L11(:,2), L11(:,3), 'r')
    title('1 (d) Pairwise intersection of parallel lines')
    hold on
    plot3(L12(:,1), L12(:,2), L12(:,3), 'r')

    plot3(L21(:,1), L21(:,2), L21(:,3), 'r')
    plot3(L22(:,1), L22(:,2), L22(:,3), 'r')

    plot3(L31(:,1), L31(:,2), L31(:,3), 'r')
    plot3(L32(:,1), L32(:,2), L32(:,3), 'r')

    plot3(LL11(:,1), LL11(:,2), LL11(:,3), 'b')
    plot3(LL12(:,1), LL12(:,2), LL12(:,3), 'b')

    plot3(LL21(:,1), LL21(:,2), LL21(:,3), 'b')
    plot3(LL22(:,1), LL22(:,2), LL22(:,3), 'b')

    plot3(LL31(:,1), LL31(:,2), LL31(:,3), 'b')
    plot3(LL32(:,1), LL32(:,2), LL32(:,3), 'b')

    hold off
    print('plt_2', '-dpng')
    
    
end