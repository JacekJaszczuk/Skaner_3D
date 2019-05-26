% Start programu:
imaqhwinfo('winvideo');
imaqhwinfo('winvideo', 1);
vid = videoinput('winvideo', 1, 'YUY2_640x480');
preview(vid);


data = getsnapshot(vid);
red = data(:, :, 1);

a = zeros(size(data, 1), size(data, 2));
just_red = cat(3, red, a, a);%wyzerowanie sk³adowych g i b
imtool(just_red);            %zrzut ekranu w barwach czerwonych

hsv = rgb2hsv(just_red);     %konwersja rgb na palete hsv
v = hsv(:, :, 3);            %szukamy najasniejszej barwy 
max_v = max(max(v));         % sam max bierze z kazdej kolumny maksymalna wartosc a max(max) z calej macierzy jedna maksymalna wartosc
[r, c] = find(v == max_v);   %wpó³rzêdne maksymalnych punktów w macierzy
x = median(c);

%Triangulacja

d = 13.5;                    %odleg³osc kamery od lasera
a = 7.5;                     %wielkosc podstawy trojkata (widzianego obiektu)
z = 21.5;                    %znana wysokosc trojkata h (umocowanie kamery rownolegle do powierzchni)

%Wyznaczamy ogniskow¹:
laserkat = 33;               %kat alfa z rysunku (90 - 57, bok a= 13.5, bok b 21.5)
tangess=(a/2*z);             %kat widzenia kamery
f = 320/tangess;             %(320 - srodek kamery, polowa rozdzielczosci) - ogniskowa 

%Wyznaczamy k¹t alfa w radianach:
alfa = laserkat*(pi/180);    %laserkat w radianach, ¿eby zrobiæ tangensa (matlab chce radiany) 
kat = tan(alfa);             %tanges lasekat w radianach 

%Wyznaczamy odleg³osc:
%d/odleglosc=y;
y = kat + ((x - 320)/f);     %przekszta³camy wzór aby otrzymaæ odleg³osc
odleglosc = d/y;             %ostateczna odleglosc


format shortg
%wynik = odleglosc/10;
%sprintf('%.lf', wynik)
close all;
% Stop.


