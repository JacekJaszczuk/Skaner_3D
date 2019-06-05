vid = kamera_init(); % Inicjalizacja kamery.
s = motor_init();    % Inicjalizacja silnika.

numer_pliku = 1;         % Początkowy numer pliku.
katalog = 'Kaczka_foto'; % Do jakiego katalogu zapisywać pomiar.

% Zbierz dane:
for i = 1:360
    kamera_fun(vid, numer_pliku, katalog);
    motor_kat(s, 1);
    numer_pliku = numer_pliku + 1;
end

% Dokonaj analizy:
[x,y,z] = analiza(katalog);
[xx,yy,zz] = filtr(x,y,z,12,44);
rysuj(xx,zz,yy);