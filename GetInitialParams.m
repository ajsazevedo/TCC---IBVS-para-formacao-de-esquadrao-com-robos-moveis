%Inicializa o robo, pega frame inicial para saber a referencia

function Referencia = GetInitialParams()
    Img = GetImage2();
    Referencia = GetFeatures(Img);
end