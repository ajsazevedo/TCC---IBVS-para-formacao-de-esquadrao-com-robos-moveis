%Passar as velocidades para o robo

function [x, y, wl, wr, theta] = GetRobotVelocity(x, y, vx, wz, ts, theta)
     
    x = x + ts*(vx*cos(theta));
    y = y + ts*(vx*sin(theta));
    theta = theta + ts*wz;
    wheelRadius = 0.028;
    wheelBase = 0.026;
    obj = DifferentialDrive(wheelRadius, wheelBase);
    [wl, wr] = inverseKinematics(obj, vx, wz);    
end