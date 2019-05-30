function motor_kat( motorSession, kat )
%liczba_krokow_na_obrot = 56348; Stara liczba kroków na obrót.
liczba_krokow_na_obrot = 9048;
kroki_na_stopien = liczba_krokow_na_obrot / 360;

for k = 1: kroki_na_stopien*kat
    outputSingleScan(motorSession, [1 0 0 0]);
    pause(1/1000);
    %java.lang.Thread.sleep(1*10)
    outputSingleScan(motorSession, [0 1 0 0]);
    pause(1/1000);
    %java.lang.Thread.sleep(1*10)
    outputSingleScan(motorSession, [0 0 1 0]);
    pause(1/1000);
    %java.lang.Thread.sleep(1*10)
    outputSingleScan(motorSession, [0 0 0 1]);
    pause(1/1000);
    %java.lang.Thread.sleep(1*10)
end

outputSingleScan(motorSession, [0 0 0 0]);
release(motorSession);
  
end

