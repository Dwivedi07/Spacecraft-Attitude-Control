function om = om_cal(t)
cm = zeros(6,1);
cm(1:3)=[0.3*cos(t)*(1-exp(-0.01*t*t))+(0.08*pi + 0.006*sin(t))*t*exp(-0.01*t*t);
  0.3*cos(t)*(1-exp(-0.01*t*t))+(0.08*pi + 0.006*sin(t))*t*exp(-0.01*t*t);
  1];

syms k
w1=0.3*cos(k)*(1-exp(-0.01*k*k))+(0.08*pi + 0.006*sin(k))*k*exp(-0.01*k*k);
w2= 0.3*cos(k)*(1-exp(-0.01*k*k))+(0.08*pi + 0.006*sin(k))*k*exp(-0.01*k*k);
w3=1;
d1 = diff(w1,k);
d2 = diff(w2,k);
d3 = diff(w3,k);

cm(4:6)= [vpa(subs(d1,k,t));
         vpa(subs(d2,k,t));
         vpa(subs(d3,k,t))];
om = cm;
end