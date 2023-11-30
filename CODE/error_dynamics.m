function dydt = error_dynamics(t,y,kw,kp)

J = [20 1.2 0.9; 1.2 17 1.4; 0.9 1.4 15];
% kw = 8;
% kp = 2000;
s0 = y(1:1);
sv = y(2:4);
dw = y(5:7);
d_s0 = (-0.5)*dot(sv,dw);
d_sv = (0.5)*(s0*mtimes(eye(3),dw) + cross(sv,dw));
v = [y(1)+d_s0;y(2)+d_sv(1);y(3)+d_sv(2);y(4)+d_sv(3)];
n = norm(v);
%n=1;
dydt =[ (-0.5)*dot(sv,dw)/n;
           (0.5/n)*(s0*mtimes(eye(3),dw) + cross(sv,dw));
            (-kw)*(mtimes(inv(J),dw))-kp*mtimes(inv(J),sv)];
end