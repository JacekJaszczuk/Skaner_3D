function vid = kamera_init()
imaqhwinfo('winvideo');
imaqhwinfo('winvideo', 1);
vid = videoinput('winvideo', 1, 'YUY2_640x480');
end

