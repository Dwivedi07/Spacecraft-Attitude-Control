function dydt = spacecraft_dyn_known_J(t,y)

J = [20 1.2 0.9; 1.2 17 1.4; 0.9 1.4 15];
kw = 20;
kp = 18;
qs = y(1:1);
qv = y(2:4);
w = y(5:7);
d_q0 = (-0.5)*dot(qv,w);
d_qv = (0.5)*(qs*mtimes(eye(3),w) + cross(qv,w));
v = [y(1)+d_q0;y(2)+d_qv(1);y(3)+d_qv(2);y(4)+d_qv(3)];
n = norm(v);
%n=1;
dydt =[ (-0.5)*dot(qv,w)/n;
           (0.5/n)*(qs*mtimes(eye(3),w) + cross(qv,w));
            (-kw)*mtimes(inv(J),w)-kp*mtimes(inv(J),(y(2:4)))];
end