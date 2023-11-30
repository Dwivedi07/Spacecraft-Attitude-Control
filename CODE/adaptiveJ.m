function dydt = adaptiveJ(t,y,kpsi,J,Jinv,kp,g)
J = J;
invJ = Jinv;
Rs = q_to_R(y(1:4));
%desired traj calculations
c = om_cal(t);
wd = c(1:3);
wddot = c(4:6);

s0 = y(1:1);
sv = y(2:4);
dw = y(5:7);
theta_hat = y(8:13);
w = dw + mtimes(Rs,wd);

d_s0 = (-0.5)*dot(sv,dw);
d_sv = (0.5)*(s0*mtimes(eye(3),dw) + cross(sv,dw));
v = [y(1)+d_s0;y(2)+d_sv(1);y(3)+d_sv(2);y(4)+d_sv(3)];
n = norm(v);
phi = -cross(dw,mtimes(Rs,wd)) + mtimes(Rs,wddot);

%calculating J had matrix from theta hat
J_hat = mx_conv(theta_hat);
J_hat_a = mtimes(J_hat,d_sv);
diff = mtimes(invJ,(-cross(w,mtimes((J-J_hat),w)))-mtimes((J-J_hat),phi));
%Calculate Matrix
W = calc_W(kp,w,phi,d_sv);
% W = [1 1 1 4 4 4;
%     2 2 2 5 5 5;
%     2 3 4 6 7 8];
dydt =[ (-0.5)*dot(sv,dw)/n;
        (0.5/n)*(s0*mtimes(eye(3),dw) + cross(sv,dw));
        (-kpsi)*(mtimes(invJ,(dw+kp*sv)))-(kp)*(mtimes(invJ,J_hat_a))+diff;
         g*mtimes(W',(dw+kp*sv))];
end