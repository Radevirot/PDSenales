# buscamos la forma de cargar el wav

[signal, fm] = audioread('escala.wav');
#player = audioplayer(x,fm); play(player) #reproducir audio
signal = signal';

sample_amount = length(signal);
samples = (1:sample_amount);

stem(samples,signal)

#ok, here comes my reasoning:
#acá no tenemos picos, sabemos que las notas están todas una al lado de la otra,
#y además sabemos cuánto tiempo dura cada una de las notas (0.5s), el ejercicio
#nos pide específicamente CUÁNDO SUENA LA, no nos dice que quiere la secuencia
#de notas ni nada por el estilo.

#entonces, lo que deberíamos hacer es recorrer esta señal por tanda de muestras,
#donde cada tanda sería de 0.5s de duración para la fm de la señal (11025Hz),
#extraemos la tanda, la comparamos con la senoidal de LA y nos guardamos el
#dot en un vector, después vemos cuál es el máximo en el vector y listo, ahí
#está LA.

window_duration = 0.5;#s
window_duration_s = floor(window_duration*fm);
signal_length = sample_amount/fm;
note_quantity=signal_length/window_duration;
LA_freq = 440;
[~,LA] = senoidal(0, window_duration, fm, LA_freq, 0, 1);
dots_LA =[];


for s=1:window_duration_s:sample_amount-window_duration_s+1
  current_window = signal(s:s+window_duration_s-1);
  dots_LA = [dots_LA dot(LA,current_window)];
endfor

[~,i] = max(dots_LA);
LA_time_seconds = window_duration*(i-1) #i-1 porque sino arranca desde 0.5


