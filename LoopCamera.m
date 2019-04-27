% Monitorar a imagem da camera
clear
disp('Pressione enter para configurar a posicao padrao.')
input('');
cam = CentralCamera('default');
Ref = bsxfun(@plus, 200*[-1 -1 1 1; -1 1 1 -1], cam.pp');%GetInitialParams();

%Posicao inicial do robo
ts = 0.050;
x = 1;
y = 1;
theta = 0;
pause on;
count = 1;
wr = 0;
wl = 0;
vx = 0;
wz = 0;
disp('Posicao padrao configurada, pressione enter para inciar.')
input('');
while (count < 100)
    Img = GetImage();
    Table = GetFeatures(Img);
    [vx, wz] = MakeIBVS(cam, Table, x, y, Ref, theta);
    results(count, 1) = vx;
    results(count, 2) = wz;
    results(count, 3) = theta;
    [x, y, wl, wr, theta] = GetRobotVelocity(x, y, vx, wz, ts, theta);
    SendDataRobot(wl, wr);
    results(count, 4) = wl;
    results(count, 5) = wr;
    count= count+1;
    pause(ts);
end

%Resultados de velocidade vx e wz
Tr = array2table(results, 'VariableNames', {'vx', 'wz', 'theta', 'wl', 'wr'});


