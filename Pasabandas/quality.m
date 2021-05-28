%Calculadora de factor de calidad
function [Q,f_center] = quality(f1,f2)
    f_center = sqrt(f1*f2);
    Q = f_center/(f2-f1);
end

