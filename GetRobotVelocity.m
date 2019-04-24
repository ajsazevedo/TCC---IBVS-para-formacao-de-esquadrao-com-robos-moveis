%Passar as velocidades para o robo

function [x, y, wl, wr] = GetRobotVelocity(x, y, vx, wz)
    x = x + vx;
    y = y + (x*cos(wz));
    wheelRadius = 0.028;
    wheelBase = 0.026;
    obj = DifferentialDrive(wheelRadius, wheelBase);
    [wl, wr] = inverseKinematics(obj, vx, wz);    
end