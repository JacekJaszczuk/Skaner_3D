vid = kamera_init()
s = motor_init()

numer_pliku = 1;
katalog = 'Kaczka_foto';

for i = 1:360
    wek_odleglosc(i) = kamera_fun(vid, numer_pliku, katalog)
    motor_kat(s, 1)
    numer_pliku = numer_pliku + 1;
end