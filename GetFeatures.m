%Funcao para pegar os centroides (pontos de interesse da imagem)
%devolve uma tabela com as posicoes encontradas

%Define a imagem
function [tableA] = GetFeatures(img)
    %filename = "C:\Users\Antonio\Desktop\4points.jpg";
    im_targets = imread(img);
    
    %imshow(im_targets);
    gray_image = rgb2gray(im_targets); 
    imshow(gray_image);
    [cluster,radii] = imfindcircles(gray_image,[50 75],'ObjectPolarity','dark',...
    'Sensitivity',0.95,'Method','twostage');
    h = viscircles(cluster,radii);
    %para cada um, econtra a centroide da elipse e armazena na tabela
    tableA = zeros(4, 2);
    count = 1;
    %para cada um, econtra a centroide da elipse e armazena na tabela
    for i=[3 1 4 2]
        tableA(count,:) = cluster(i,:);
        count= count+1;
    end
end