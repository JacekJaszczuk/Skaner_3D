% Funkcja do uruchomienia silnika krokowego:

function [motorSession] = runMotors(motorSession, krok)
  % Krok podany przez producenta
  %krok=1.8;
  
  %iterations = (3600/krok)*18; %72000
  
 for k = 1: 56348
 %while(1)
    outputSingleScan(motorSession, [1 0 0 0]);
    pause(1/1000);
    outputSingleScan(motorSession, [0 1 0 0]);
  pause(1/1000);
    outputSingleScan(motorSession, [0 0 1 0]);
  pause(1/1000);
    outputSingleScan(motorSession, [0 0 0 1]);
  pause(1/1000);
     
  end
  
  outputSingleScan(motorSession, [0 0 0 0]);
  release(motorSession);
  
end

