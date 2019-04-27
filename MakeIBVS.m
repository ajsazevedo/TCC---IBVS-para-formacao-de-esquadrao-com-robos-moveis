%Retorna a velocidade vx e wz para um IBVS completo

function [vx, wz] = MakeIBVS(cam, Table, x, y, Ref, theta)
%     %MOVEMENT%
%     %Inicia a camera (posteriormente passar para a funcao)
%     cam = CentralCamera('default','color','w');
%     %Imagem simulada (Usar Table)
%     Tc = transl(0,0,x)*troty(-3);    
%     p = cam.plot(Table, 'Tcam', Tc);
%     %Imagem Desejada
%     %pStar = Ref;
%     pStar = [446.806640446827, 633.891410828093, 633.763308980530, 446.137148880242; 256.484437095418, 105.273763281784, 256.522565118447, 105.813145682668];%[435.6739,146.3878,153.0408,461.5736;250.8097,282.8095,441.9430,413.7856];
%     ibvs = IBVS(cam, 'T0', Tc, 'pstar', pStar, 'niter', 1, 'lambda', 2);
%     ibvs.run();

 
 pStar = Ref;
 Tc0 = transl(0,0,-1)*troty(theta - 15);
 ibvs = IBVS(cam, 'T0', Tc0, 'pstar', pStar,  'niter', 10);
 imshow(pStar);
 plot(pStar);
 ibvs.run();
    vx = ibvs.vel_p(1,1);
    wz = ibvs.vel_p(5,1);
end
%Funcoes ainda nao usadas
% bsxfun(@plus, 200*[-1 -1 1 1; -1 1 1 -1], cam.pp');
%pStar = [237.044000000000,247.527000000000,650.032000000000,609.537000000000;108.557000000000,377.525000000000,383.516000000000,135.519000000000];% bsxfun(@plus, 200*[-1 -1 1 1; -1 1 1 -1], cam.pp');
%e = pStar - p;
%J = cam.visjac_p( p, 1 );
%lambda = 0.125;
%v = lambda * pinv(J) * e(:);
%trnorm( 
%Tc0 = Tc * delta2tr(v);
%Tc0 = transl(1,1,-3)*trotz(0.6);