vid = kamera_init(); % Inicjalizacja kamery.
s = motor_init();    % Inicjalizacja silnika.

numer_pliku = 1;         % Początkowy numer pliku.
katalog = 'bransoletka_foto';   % Do jakiego katalogu zapisywać pomiar.

% Zbierz dane:
for i = 1:360
    kamera_fun(vid, numer_pliku, katalog);
    motor_kat(s, 1);
    numer_pliku = numer_pliku + 1;
end

% Dokonaj analizy:
[x,y,z] = analiza(katalog);
rysuj(x,z,y);