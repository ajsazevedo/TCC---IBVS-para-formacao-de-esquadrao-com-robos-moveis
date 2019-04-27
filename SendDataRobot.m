%passa parametros para o robo

function SendDataRobot(wl, wr)
  velrefM1 = wl;  
  sM1 = sign(wl);
  velrefM2 = wr;
  sM2 = sign(wr);
  kp1 = 100;
  ki1 = 40;
  kd1 = 0;
  kp2 = kp1;
  ki2 = ki1;
  kd2 = kd1;
  
  %Clear ports
  if ~isempty(instrfind)
     fclose(instrfind);
      delete(instrfind);
  end
  
  %%Open comunications
%   arduino = serial('COM3','BAUD',9600);
%   fopen(arduino);
%   
%   %read data?
% %   idn = fread(arduino);
% %   disp(idn);
%   
%   %Send data to arduino
%   fprintf(arduino, '%f', velrefM1);
%   fprintf(arduino, '%f', sM1);
%   fprintf(arduino, '%f', velrefM2);
%   fprintf(arduino, '%f', sM2);
%   fprintf(arduino, '%f', kp1);
%   fprintf(arduino, '%f', kp2);
%   fprintf(arduino, '%f', ki1);
%   fprintf(arduino, '%f', ki2);
%   fprintf(arduino, '%f', kd1);
%   fprintf(arduino, '%f', kd2);
%   
%   %close communications
%   fclose(arduino);  
end