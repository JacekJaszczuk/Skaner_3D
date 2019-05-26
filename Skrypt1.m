% Program pokazuje jak zarządzać kartą akwizycji NI z poziomu MATLABA.
% Obsługuje piny cyforwe i analogowe.
% Program rozpoznaje kolory.

% Instrukcja:
% GND port 50
% OUT port 68
% S0 port 17
% S1 port 52
% S2 port 47
% S3 port 49
% Vcc port 14 lub 8

clear all
close all
clc

% Zasilanie układu:
p = daq,createSession('ni');                                                % Uruchomienie sesji DAQ.
[cho, idxo] = p.addDigitalChannel('Dev1', 'port0/line0:3', 'OutputOnly');   % Uruchomienie digital output.
datao = [0, 1, 1, 1];                                                       % Ustawienie trybu pracy układu (S1, S0, S3, S2).
p.outputSingleScan(datao);                                                  % Zaprogramowanie układu co pracy.
pause(3);                                                                   % Czekaj 3 sekundy.

% Odczyt częstotliwości:
s = daq.createSession('ni')'                                                % Uruchomienie sesji DAQ
s.Rate = 1e6;                                                               % Liczba skanów na sekundę.
s.DurationInSeconds = 1.0;                                                  % Czas trwania pomiaru.
s.addAnalogInputChannel('Dev1', 'ai0', 'Voltage');                          % Uruchomienie kanału analog input.

i = 1;

while (1)
  data = startForeground(s);                                                % Uruchomienie pomiarów.
  
  r = 0;
  b = 0;
  g = 0;
  
  % Odczyt częstotliwości liczony z FFT i szukanie najwyższego prążka:
  N = length(data);                                                         % Długość wektora data.
  trans = fft(data, N);                                                     % Transformata FFT sygnału.
  rate = N;
  X = trans.*conj(trans) / N;                                               % fft*liczba_sprzężona(fft)/długość sygnału.
  f = rate / N * (0:N-1);
  f = f(10:N / 10);
  X = X(10:N / 10);
  freq = f(find(X == max(X)));
  
  if freq > 16500                                                           % Wykryto sygnał.
    n (i) = freq;
    i = i + 1;
    if (i > 8)                                                              % Pełna tablica.
      % Sprawdzanie koloru:
      if n (2) > 19001 && n(2) < 28000                                      % Niebieski.
        disp ('3')
        b = 1;
      end
      if n(5) > 69000 && n(5) < 80000                                       % Zielony.
        disp ('2')
        g = 1;
      end
      if n(8) > 17000 && n(8) < 19000                                       % Czerowny.
        disp ('1')
        r = 1;
      end
      
      n = [];
      i = 1;
    end                                                                     % end pełna tablica.
    
    % Sprawdzanie sekwencji kolorów:
    if b == 1
      if g == 1
        if r == 1
          disp ('OPEN')
          pause(5);                                                         % Czekaj 5 sekund.
        end
      end
    end
  else
    disp('CLOSE')
  end
end

    
end
