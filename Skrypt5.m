% Znowu czytanie obrazu z kamery.
% JakieÅ› obliczenia, ale takie nie za dobre.
% Linia 18 to chyba jakiÅ› Å¼art :-)
% Podaje tajne hasÅ‚o: KONIOKOT

% Start programu:
imaqhwinfo('winvideo');
imaqhwinfo('winvideo', 1);
vid = videoinput('winvideo', 1, 'YUY2_640x480');
preview(vid);


data = getsnapshot(vid);
red = data(:, :, 1);

a = zeros(size(data, 1), size(data, 2));
just_red = cat(3, red, a, a); %wyzerowanie sk³adowych g i b
imtool(just_red); %zrzut ekranu w barwach czerwonych

hsv = rgb2hsv(just_red); %konwersja rgb na palete hsv
v = hsv(:, :, 3); %wspó³rzêdna Z?

max_v = max(max(v)); % sam max bierze z kazdej kolumny maksymalna wartosc a max(max) z calej macierzy jedna maksymalna wartos
[r, c] = find(v == max_v); %wpó³rzêdne maksymalnych punktów w macierzy
x = median(c);

d = 13.5; %odleg³osc kamery od lasera
a = 7.5;  %   wielkosc podstawy trojkata (widzianego obiektu)
z = 21;  %znana wysokosc trojkata h (umocowanie kamery rownolegle do powierzchni)

laserkat = 31; %kat alfa z rysun
tangess=(a/2*z);  %tanges, kat przez dwa
f = 320/tangess;  %(320 - srodek kamery, polowa rozdzielczosci) - ogniskowa 

alfa = laserkat*(pi/180); %laserkat w radianach 
kat = tan(alfa);
y = kat + ((x - 320)/f); %triangulacja, wzor: https://pl.wikipedia.org/wiki/Triangulacja_(sensoryka)
odleglosc = d/y; %odlegosc jako r
format shortg
wynik = odleglosc/10;
sprintf('%.lf', wynik)
close all;
% Stop.