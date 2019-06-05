function [x, y, z] = filtr(x, y, z, min_z, max_z)
% Wytnij nie potrzebne z:
usun_z = [];
for i = 1:length(z)
  if (z(i) < min_z) || (z(i) > max_z)
    usun_z = [usun_z i];
  end
end
z(usun_z) = [];
x(usun_z) = [];
y(usun_z) = [];
end
