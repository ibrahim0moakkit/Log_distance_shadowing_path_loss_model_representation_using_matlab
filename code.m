
%**Log Normal Shadowing Path Loss Model**

%log_normal_shadowing(fc,d,Gt,Gr,n,d0,segma)  

%where
% fc : carrier frequency [Hz]
% d  : distance between the transmitter and the receiver [m]
% Gt and Gr : transmitter gain and receiver gain respectively 
% d0 : reference distance [m]
% segma : standard deviation
% n  : path loss exponent depends on the environment

d=[1:2:31].^2;
d0=100;

PL1=log_normal_shadowing(1800*10^6,d,1,1,2,d0,3); % Gt=1 Gr=1 segma=3 n=2
PL2=log_normal_shadowing(1800*10^6,d,1.5,2,3,d0,3); % Gt=1.5 Gr=2 segma=3 n=3


semilogx(d,PL1),grid on,title('Log Normal Shadowing Path Loss Model'),xlabel('distance[m]'),ylabel('path loss [dB]')
hold on
semilogx(d,PL2),
legend('PATH 1 : Gt=1, Gr=1, n=2, segma=3','PATH 2 : Gt=1.5 and Gr=2, n=3, segma=3')
hold off

function PL=log_normal_shadowing(fc,d,Gt,Gr,n,d0,segma)
lamda=3*10^8/fc; 
PL=-10*log10((Gt*Gr*(lamda)^2)./((4*pi)^2.*(d).^2))+10*n*log10(d./d0)+segma*randn(size(d));
end



%  *************************************
%  * DONE BY: IBRAHIM MOAKKIT          *
%  * EMAIL: ibrahimmoakkit@outlook.com *
%  *************************************
