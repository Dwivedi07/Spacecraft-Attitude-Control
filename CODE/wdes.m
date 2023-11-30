function w = wdes(i,l)
t = (60/(l-1))*(i-1);
w=[0.3*cos(t)*(1-exp(-0.01*t*t))+(0.08*pi + 0.006*sin(t))*t*exp(-0.01*t*t);
  0.3*cos(t)*(1-exp(-0.01*t*t))+(0.08*pi + 0.006*sin(t))*t*exp(-0.01*t*t);
  1];

end