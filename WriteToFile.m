function [filename] = WriteToFile(img)    
    filename = datestr(now,'HH-MM-SS-FFF');  
    filename = strcat('imagem', filename, '.jpg');
    imwrite(img, filename);
end