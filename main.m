vid = kamera_init()
s = motor_init()

for i = 1:360
    odleglosc = kamera_fun(vid)
    motor_kat(s, 1)
end