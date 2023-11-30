function dydt = desire_traj(t,y)
qs = y(1:1);
qv = y(2:4);
w=[0.3*cos(t)*(1-exp(-0.01*t*t))+(0.08*pi + 0.006*sin(t))*t*exp(-0.01*t*t);
  0.3*cos(t)*(1-exp(-0.01*t*t))+(0.08*pi + 0.006*sin(t))*t*exp(-0.01*t*t);
  1];
d_q0 = (-0.5)*dot(qv,w);
d_qv = (0.5)*(qs*mtimes(eye(3),w) + cross(qv,w));
v = [y(1)+d_q0;y(2)+d_qv(1);y(3)+d_qv(2);y(4)+d_qv(3)];
n = norm(v);
dydt =[ d_q0/n;
        d_qv/n];
end