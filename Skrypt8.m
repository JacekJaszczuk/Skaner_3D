% Akwizycja cyfrowa.
% Całkiem ogarnięta :-)

% Utworzenie sesji akwizycji danych:
s = daq.createSession('ni');

% Dodanie kanałów cyfrowych do sesji i ustawienie ich jako wyjść:
s.addDigitalChannel('Dev1', 'Port0/Line0', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port0/Line1', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port0/Line2', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port0/Line3', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port0/Line4', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port0/Line5', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port0/Line6', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port0/Line7', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port1/Line0', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port1/Line1', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port1/Line2', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port1/Line3', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port1/Line4', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port1/Line5', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port1/Line6', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port1/Line7', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port2/Line0', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port2/Line1', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port2/Line2', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port2/Line3', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port2/Line4', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port2/Line5', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port2/Line6', 'InputOnly')
s.addDigitalChannel('Dev1', 'Port2/Line7', 'InputOnly')

% Odstęp czasu pomiędzy skanami w sekundach:
dt = 0.1;
% Liczba skanów:
N = 100000;
% Pętla w której wykonywane są skany i wyświetlanie pozycji:
for i = 1:N
  % Pojedynczy skan wszystkich wejść cyfrowych:
  dataIn = s.inputSingleScan();
  % Podział wektora próbek wejściowych na dwie składowe - oś x i y:
  X = dataIn(1:12);
  Y = dataIn(13:24);
  
  % Wyszukiwanie największego elementu, czyli portu na którym pojawia się sygnał:
  [Mx, Ix] = max(X);
  [My, Iy] = max(Y);
  
  % Wyświetlanie punktów:
  if Mx == 1 && My == 1
    plot (Ix, Iy, 'p');
    axis ([0 13 0 13]);
    grid on;
  else
    plot(-1, -1, 'p');
    axis([0 13 0 13]);
    grid on;
  end
  pause(dt);
end
