function y = reverb(x, h)
    %Se hace la convolución
    y = conv(x,h);
    %Normalizamos dividiendo entre el máximo absoluto
    m = max(y);
    g = abs(min(y)); %sacamos el valor absoluto de los extremos
    star = max(m,g); %Averiguamos cuál de los dos es mayor
    y = y/star; %Devolvemos el valor normalizado
end
