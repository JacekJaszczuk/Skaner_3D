vid = kamera_init()
s = motor_init()

for i = 1:360
    wek_odleglosc(i) = kamera_fun(vid)
    motor_kat(s, 1)
end