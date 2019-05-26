% Koleżanka skryptu 6:

function [motorSession] = initMotors()
  motorSession = daq.createSession('ni');
  addDigitalChannel(motorSession, 'Dev1', 'port0/line0:3', 'OutputOnly');
end
