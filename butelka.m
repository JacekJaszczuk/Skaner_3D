% Punkty zebrane z butelki piwa:
piwo = [ones(1, 360)*6.5/2];
piwo = [piwo; ones(1, 360)*6.4/2];
piwo = [piwo; ones(1, 360)*6.3/2];
piwo = [piwo; ones(1, 360)*6.2/2];
piwo = [piwo; ones(1, 360)*6.1/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*6.0/2];
piwo = [piwo; ones(1, 360)*5.7/2];
piwo = [piwo; ones(1, 360)*5.4/2];
piwo = [piwo; ones(1, 360)*5.1/2];
piwo = [piwo; ones(1, 360)*4.8/2];
piwo = [piwo; ones(1, 360)*4.5/2];
piwo = [piwo; ones(1, 360)*4.4/2];
piwo = [piwo; ones(1, 360)*4.3/2];
piwo = [piwo; ones(1, 360)*4.2/2];
piwo = [piwo; ones(1, 360)*4.1/2];
piwo = [piwo; ones(1, 360)*4.0/2];
piwo = [piwo; ones(1, 360)*3.9/2];
piwo = [piwo; ones(1, 360)*3.8/2];
piwo = [piwo; ones(1, 360)*3.7/2];
piwo = [piwo; ones(1, 360)*3.6/2];
piwo = [piwo; ones(1, 360)*3.5/2];
piwo = [piwo; ones(1, 360)*3.4/2];
piwo = [piwo; ones(1, 360)*3.3/2];
piwo = [piwo; ones(1, 360)*3.2/2];
piwo = [piwo; ones(1, 360)*3.1/2];
piwo = [piwo; ones(1, 360)*3.0/2];

% Znamy promień i kąt. Trzeba wyliczyć zwykłe zmienne:
piwo_x = [];
piwo_y = [];
piwo_z = [];
for i = 1:360
  piwo_x = [piwo_x (cos(i/180*pi)*piwo(:,1))'];
  piwo_y = [piwo_y (sin(i/180*pi)*piwo(:,1))'];
  piwo_z = [piwo_z [0.5:0.5:24]];
end

% Rysujemy wykres:
plot3(piwo_x, piwo_y, piwo_z)
axis("equal")