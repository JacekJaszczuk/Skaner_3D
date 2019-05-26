% Akwizycja danych z karty.
% Wizualizacja danych.

s = daq.createSession('ni')
s.addAnalogInputChannel('Dev1', 'ai0', 'voltage')
s.addAnalogInputChannel('Dev1', 'ai1', 'voltage')
s.addAnalogInputChannel('Dev1', 'ai2', 'voltage')
s.addAnalogInputChannel('Dev1', 'ai3', 'voltage')
s.addAnalogInputChannel('Dev1', 'ai4', 'voltage')
s.addAnalogInputChannel('Dev1', 'ai5', 'voltage')
s.Channels(1).InputType = 'SingleEnded';
s.Channels(2).InputType = 'SingleEnded';
s.Channels(3).InputType = 'SingleEnded';
s.Channels(4).InputType = 'SingleEnded';
s.Channels(5).InputType = 'SingleEnded';
s.Channels(6).InputType = 'SingleEnded';
s.addDigitalChannel('dev1', 'Port0/Line0:5', 'OutputOnly');

hf = figure('position', [0 0 eps eps], 'menubar', 'none');
roznica_napiec = 1;
while 1
  data = s.inputSingleScan;
  data2 = data - mean(data, 2);
  wyjscie1 = [];
  for k = 1:6
    if data2 (k) >= roznica_napiec
      wyjscie1 = [wyjscie1 0];
    elseif data2 (k) < roznica_napiec
      wyjscie1 = [wyjscie1 1];
    end
  end
  wyjscie1
  s.outputSingleScan(wyjscie1)
  pause(0.5)
  if strcmp(get(hf, 'currentcharacter'), 'q')
    wyjscie1 = [0 0 0 0 0 0];
    s.outputSingleScan(wyjscie1)
    close(hf)
    break
  end
  figure(hf)
  drawnow
end
