function [wsp_x, wsp_y, wsp_z] = analiza2(katalog)
% Stałe środowiska pomiarowego:
d = 13.5;                 % Odległość kamery od lasera (cm).
a = 7.5;                  % Wielkość podstawy trojkata; szerokość ramki obrazu (cm).
z = 21.5;                 % Odległość od soczewki kamery do środka podstawy (cm).
laserkat = atand(d/z);    % Kąt padania lasera.

% Wyznaczamy ogniskową:
kamerakat = atand(a/2/z); % Pół kąta widzenia kamery. 
f = 320/tand(kamerakat);  % Ogniskowa.

% Zmienna do trzymania odległości:
odleglosci = [];
odleglosci_mw = [];

% Odczytaj odległość z poszczególych obrazów:
for i = 1:360
  load(sprintf('%s/dane%d.mat', katalog, i));       % Załaduj dane.
  data = data(:, :, 1);                             % Zostaw tylko barwę czerwoną.
  % Analizuj co 10 pikseli:
  for j = 1:48
    buf = data([(j-1)*10+1:j*10],:);                % Wytnij tylko interesujące nas próbki.
    max_red = max(max(buf));                        % Szukaj wartości maksymalnej.
    [r, c] = find(buf == max_red);                  % Znajdź wszystkie punkty z maksymalną wartością.
    x = median(c);                                  % Wybierz punkt środkowy.
    r = d/(tand(laserkat)+(x-320)/f);               % Wyznaczamy odległość od soczewki kamery.
    odleglosc = r-z;                                % Wyznaczamy odległość od środka podstawy.
    odleglosci_mw = [odleglosci_mw; odleglosc]; % Zapisujemy tą odleglość do małego wektora odległości.
  end
  odleglosci = [odleglosci odleglosci_mw];          % Zapisujemy mały wektor odległości do macierzy odległości.
  odleglosci_mw = [];
end

% Spłaszcz macierz odległości:
buf = [];
for i = 1:48
  buf = [buf odleglosci(i,:)];
end
odleglosci = buf;

% Generuj odpowiadające kąty dla promieni:
katy = [];
for i = 1:48
  katy = [katy [1:360]];
end

% Generuj współrzędne x i y:
[wsp_x, wsp_y] = pol2cart(deg2rad(katy), odleglosci);

% Generuj współrzędną z:
wsp_z = [];
for i = 1:48
  wsp_z = [wsp_z ones(1, 360)*i];
end
wsp_z = wsp_z*(-1);
end