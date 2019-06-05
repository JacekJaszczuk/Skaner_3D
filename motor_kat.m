function motor_kat( motorSession, kat )
liczba_krokow_na_obrot = 9048;
kroki_na_stopien = liczba_krokow_na_obrot / 360;

% Przemiataj po kolei cewki, tak aby obróciæ o podany k¹t: 
for k = 1: kroki_na_stopien*kat
    outputSingleScan(motorSession, [1 0 0 0]);
    pause(1/1000);
    outputSingleScan(motorSession, [0 1 0 0]);
    pause(1/1000);
    outputSingleScan(motorSession, [0 0 1 0]);
    pause(1/1000);
    outputSingleScan(motorSession, [0 0 0 1]);
    pause(1/1000);
end

% Wy³¹cz cewki:
outputSingleScan(motorSession, [0 0 0 0]);
release(motorSession);
  
end

