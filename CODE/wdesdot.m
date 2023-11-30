function wdot = wdesdot(i,l)
syms t
w1=0.3*cos(t)*(1-exp(-0.01*t*t))+(0.08*pi + 0.006*sin(t))*t*exp(-0.01*t*t);
w2= 0.3*cos(t)*(1-exp(-0.01*t*t))+(0.08*pi + 0.006*sin(t))*t*exp(-0.01*t*t);
w3=1;
d1 = diff(w1,t);
d2 = diff(w2,t);
d3 = diff(w3,t);
z = (60/(l-1))*(i-1);
wdot = [vpa(subs(d1,t,z));
        vpa(subs(d2,t,z));
        vpa(subs(d3,t,z))];
end