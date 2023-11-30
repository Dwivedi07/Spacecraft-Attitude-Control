function W = calc_W(kp,w,phi,d_sv)

% syms param [6 1] 
% syms rswdrswd [3 1] 
% syms qerv [3 1] 
% syms rota [3 1] 
% syms gain
% syms WM [3 6]
% J = [param(1) param(2) param(3);
%      param(2) param(4) param(5);
%      param(3) param(5) param(6)];
% wt = -cross(rota,mtimes(J,rota)) - mtimes(J,rswdrswd) + gain*mtimes(J,qerv);
% for i = 1:3
%     for j = 1:6
%         WM(i,j) = diff(wt(i),param(j));
%         WM(i,j) = vpa(subs(WM(i,j),gain,kpi));
%         WM(i,j) = vpa(subs(WM(i,j),qerv,d_svi));
%         WM(i,j) = vpa(subs(WM(i,j),rswdrswd,phii));
%         WM(i,j) = vpa(subs(WM(i,j),rota,wi));
%     end
% end

W = [(d_sv(1)*kp-phi(1)) (d_sv(2)*kp-phi(2)+w(1)*w(3)) (d_sv(3)*kp-phi(3)-w(1)*w(2)) (w(2)*w(3)) (w(3)*w(3)-w(2)*w(2)) (-w(2)*w(3));
    (-w(1)*w(3)) (d_sv(1)*kp-phi(1)-w(2)*w(3)) (w(1)*w(1)-w(3)*w(3)) (d_sv(2)*kp-phi(2)) (d_sv(3)*kp-phi(3)+w(1)*w(2)) (w(1)*w(3));
     (w(1)*w(2)) (w(2)*w(2)-w(1)*w(1)) (d_sv(1)*kp-phi(1)+w(2)*w(3)) (-w(1)*w(2)) (d_sv(2)*kp-phi(2)-w(1)*w(3)) (d_sv(3)*kp-phi(3))];
 
end