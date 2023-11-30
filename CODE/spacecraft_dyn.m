function dydt = spacecraft_dyn(t,y)

J = [20 1.2 0.9; 1.2 17 1.4; 0.9 1.4 15];
qs = y(1:1);
qv = y(2:4);
w = y(5:7);
d_qs = (-0.5)*dot(qv,w);
d_qv = (0.5)*(qs*mtimes(eye(3),w) + cross(qv,w));
v = [y(1)+d_qs;y(2)+d_qv(1);y(3)+d_qv(2);y(4)+d_qv(3)];
n = norm(v);
dydt =[ (-0.5)*dot(qv,w)/n;
           (0.5/n)*(qs*mtimes(eye(3),w) + cross(qv,w));
            mtimes(inv(J),cross(-w,mtimes(J,w)))];
end