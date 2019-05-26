function s = motor_init()
s = daq.createSession('ni');
s.addDigitalChannel('dev1','Port0/Line0:3','OutputOnly');
end

