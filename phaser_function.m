%Filtro phaser

function y = phaser_function(x, fs);
    %x es el array/vector del audio
    %fs es la frecuencia de muestreo
    delay = 25; %15 son los valores experimentales que suenan bien
    range = 50; %12 aunque se pueden modificar para que el phaser 
    sweep_freq = 0.3125/2; %0.3125 tenga diferentes propiedades
    N = length(x(:,1))-delay-range;
    %reservar el espacio de memoria
    y = zeros(N,1);
    %aplicar ecuación de diferencias
    for i = 1:N
        temp = i - delay - round(range*sin(2*pi*i*sweep_freq/fs));
        %Acá solo nos aseguramos de que la señal siga igual siempre y cuando 
        %i sea positivo porque matlab no admite coeficientes negativos
        %el problema se elimina sumando delay y round() pero esto hace que el
        %sistema deje de ser causal, lo que ocasiona que no se pueda utilizar
        %para procesar audio en tiempo real. Únicamente podría procesar audio
        %cargado a la memoria, en este caso no importa pero lo dejé así 
        %(signo negativo) para
        %utilizar las mismas convenciones que utilizamos en la teoría.

        if (temp>0)
            y(i) = x(i) + x(temp);
        else
            y(i) = x(i);
        end

    end
    %delay es el delay por defecto que tiene la señal
    %range es la amplitud del efecto
    %sweep_freq es la frecuencia con la que cambiamos la frecuencia de
    %corte del notch y el pasabandas.
end

