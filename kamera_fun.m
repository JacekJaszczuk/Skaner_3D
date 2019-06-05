function kamera_fun(vid, numer_pliku, katalog)
data = getsnapshot(vid);                                       % Zrób zrzut z kamery.
save(sprintf('%s/dane%d.mat', katalog, numer_pliku), 'data');  % Zapisz dane pomiarowe do katalogu.
red = data(:, :, 1);                                           % Tylko czerwona barwa.
preview(vid)                                                   % Poka¿ widok z kamery.
end

