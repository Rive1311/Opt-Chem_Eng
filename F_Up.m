function fup=fuptest(x)
Data_Up;

%elemental composition
f1=((tc1 - sum((x.*cp1)))/tc1).^2;
f2=((th1-  sum((x.*hp1)))/th1).^2;
f3=((to1 - sum((x.*op1)))/to1).^2;
f4=((tn1 - sum((x.*np1)))/tn1).^2;
%TBP
f5=((max(cumsum(x( bp1(1,:)<100)))-5.3)).^2;
f6=((max(cumsum(x( bp1(1,:)<150)))-12)).^2;
f25=((max(cumsum(x( bp1(1,:)<187.7)))-14.448)).^2;
f7=((max(cumsum(x( bp1(1,:)<200)))-16)).^2;
f8=((max(cumsum(x( bp1(1,:)<250)))-25)).^2;
f26=((max(cumsum(x( bp1(1,:)<270)))-33.79)).^2;
f9=((max(cumsum(x( bp1(1,:)<280)))-42)).^2;
f10=((max(cumsum(x( bp1(1,:)<300)))-58.9)).^2;
f11=((max(cumsum(x( bp1(1,:)<314)))-62)).^2;
f12=((max(cumsum(x( bp1(1,:)<325)))-64)).^2;
f13=((max(cumsum(x( bp1(1,:)<350)))-69)).^2;
f14=((max(cumsum(x( bp1(1,:)<375)))-74)).^2;
f16=((max(cumsum(x( bp1(1,:)<410)))-79)).^2;
f18=((max(cumsum(x( bp1(1,:)<450)))-82)).^2;
f19=((max(cumsum(x( bp1(1,:)<500)))-84)).^2;
f20=((max(cumsum(x( bp1(1,:)<550)))-87)).^2;
f21=((max(cumsum(x( bp1(1,:)<600)))-88)).^2;
f22=((max(cumsum(x( bp1(1,:)<650)))-90)).^2;
f23=((max(cumsum(x( bp1(1,:)<700)))-92)).^2;
f24=(tot1-sum(x)).^2 ; 
% f=f5+f6+f7+f8+f9+f10+f11+f12+f13+f14+f16+f18+f19+f20+f21+f22+f23;
 f0=f1+f2+f3+f4+f24+f+(max(cumsum(x( bp1(1,:)<271)))-max(cumsum(x( bp1(1,:)<193)))-19).^2+(max(cumsum(x( bp1(1,:)<425)))-max(cumsum(x( bp1(1,:)<271)))-46).^2;

 fup=f0;

end
