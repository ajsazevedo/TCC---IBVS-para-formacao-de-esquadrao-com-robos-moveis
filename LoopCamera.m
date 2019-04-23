% Monitorar a imagem da camera

%Posicao inicial do robo
x = 1;
y = 1;
pause on;
count = 1;

while (count < 10)
    Img = GetImage();
    Table = GetFeatures(Img);
    [vx, wz] = MakeIBVS(Table, x, y);
    results(count, 1) = vx;
    results(count, 2) = wz;
    count= count+1;
    [x, y, wl, wr] = GetRobotVelocity(x, y, vx, wz);
    SendDataRobot(wl, wr);
    pause(0.050);
end

%Resultados de velocidade vx e wz
Tr = array2table(results, 'VariableNames', {'vx', 'wz'});


