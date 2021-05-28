function y = reverb(x, h)
    %Se hace la convoluci�n
    y = conv(x,h);
    %Normalizamos dividiendo entre el m�ximo absoluto
    m = max(y);
    g = abs(min(y)); %sacamos el valor absoluto de los extremos
    star = max(m,g); %Averiguamos cu�l de los dos es mayor
    y = y/star; %Devolvemos el valor normalizado
end
