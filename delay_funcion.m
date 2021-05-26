%Funci�n que maneja el delay deseado
%Autores: Juan Pablo Valenzuela y Alejandra Samayoa

%Funci�n delay
function [y2, t2]= delay_funcion(x, delay_ms, alfa, Fs)
    %Tiempo de muestreo
    ts = 1/Fs;
    
    %Calculo del numero de muestras que ocupa el delay
    delay_muestra = round((delay_ms/1000)*Fs);
    %Es importante que el tipo de dato de esta operaci�n sea entero
    
    %tama�o de salida de la se�al (numero de filas del vector columna)
    N = size(x,1);

    %reservar el espacio de memoria (vector columna)
    y2 = zeros(N,1);
    
    %Ecuaci�n de Diferencias
    %Aplicamos la ecuaci�n de diferencias
    for i = 1:N
        if i>delay_muestra
            y2(i) = x(i) + alfa*x(i-delay_muestra);
        end
        if i<=delay_muestra
            y2(i) = x(i);
        end

    end

    %pasamos de muestras a tiempo
    t2 = ts*(0:(N-1));
    t2 = t2.'; %Cambiamos de vector fila a vector columna

    %Salidas
    %y2 es la se�al procesada
    %t2 es el vector de tiempo para graficar la se�al (s)
    
    %Entradas
    %x es la se�al de entrada
    %delay_ms es el delay en milisegundos
    %alfa es la ganacia del efecto
    %Fs es la frecuencia de muestreo
    
end

