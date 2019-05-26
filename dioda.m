clear all
devices = daq.getDevices

s = daq.createSession('ni');
%addDigitalChannel(s,'dev1','Port0/Line0:1','InputOnly');
ch = addDigitalChannel(s,'dev1','Port0/Line0:3','OutputOnly');
%[ch,idx] = addDigitalChannel(s,'dev1','Port2/Line0:1','Bidirectional')
%while(1)
%ble = [0 1 1 1];
%s.outputSingleScan(ble);
%pause(2);
%ble = [1 0 1 1];
%s.outputSingleScan(ble);
%pause(2);
%ble = [1 1 0 1];
%s.outputSingleScan(ble);
%pause(2);
%ble = [1 1 1 0];
%s.outputSingleScan(ble);
%pause(2);
%end

runMotors(s, 1.8);