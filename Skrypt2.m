% Czytanie obrazu z kamery.
% Jakieś obliczenia.

close all;
clear all;

% Przygotowanie kamery i wykonanie zdjęcia:
imaqreset;
vid = videoinput('winvideo', 1, 'YUY2_640x480');
preview(vid);
data = getsnapshot(vid);

% Zapis do pliku:
imwrite(data, 'pomiar.jpg');

%%% USTAWIENIE PARAMETRÓW %%%
% Odległość kamery od lasera [mm]:
%d = 132;
% Kąt ustawienia lasera [stopnie]:
%alfa = 32*pi/180;
%tan_alfa = tan(alfa);
% Ogniskowa [piksele]:
%f = 833;
% Uzyskanie wartości piksela (piksel 0-639):
%kolumna = getColumn('pomiar.jpg');

% Wzór końcowy:
%odleglosc = d/(tan_alfa - (kolumna-320/f));
%sprintf('Odległość = %.lf cm \n', odleglosc)