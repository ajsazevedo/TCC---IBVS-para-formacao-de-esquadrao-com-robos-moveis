clear;

cam = CentralCamera('default');
 
 pStar = bsxfun(@plus, 200*[-1 -1 1 1; -1 1 1 -1], cam.pp');
 Tc0 = transl(0,0,-10)*troty(10);
 ibvs = IBVS(cam, 'T0', Tc0, 'pstar', pStar, 'niter', 20);
 ibvs.run();