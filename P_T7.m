function z = P_T7(L, I, K_I,n_I,n_L) % z is Response of T7 promoter
% L is LacI level normalized with K_L0
% K_L0 is saturation const at zero IPTG.
% I is IPTG level
 
% Parameters
%     K_I = 10;
%     n_I = 1.2;
%     n_L = 1;

    K_L = 1 + (I./K_I).^n_I;
    z = K_L.^n_L./(K_L.^n_L + L.^n_L);
end