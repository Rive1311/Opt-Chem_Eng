function fout2=foutest(x)
Data_Out;

f1=((tc1 - sum((x.*cp1)))/tc1).^2;
f2=((th1-  sum((x.*hp1)))/th1).^2;
f3=((to1 - sum((x.*op1)))/to1).^2;
f4=((tn1 - sum((x.*np1)))/tn1).^2;

f5=((max(cumsum(x( bp1(1,:)<100)))-0.76))^2;
f6=((max(cumsum(x( bp1(1,:)<150)))-2.44))^2;
f7=((max(cumsum(x( bp1(1,:)<200)))-6))^2;
f8=((max(cumsum(x( bp1(1,:)<250)))-10.8))^2;
f9=((max(cumsum(x( bp1(1,:)<280)))-16.5))^2;
f10=((max(cumsum(x( bp1(1,:)<300)))-27))^2;
f11=((max(cumsum(x( bp1(1,:)<314)))-37))^2;
f12=((max(cumsum(x( bp1(1,:)<325)))-41))^2;
f13=((max(cumsum(x( bp1(1,:)<350)))-47))^2;
f14=((max(cumsum(x( bp1(1,:)<375)))-50.4))^2;
f15=((max(cumsum(x( bp1(1,:)<400)))-55))^2;
f16=((max(cumsum(x( bp1(1,:)<410)))-56))^2;
f17=((max(cumsum(x( bp1(1,:)<437)))-60))^2;
f18=((max(cumsum(x( bp1(1,:)<450)))-63))^2;
f19=((max(cumsum(x( bp1(1,:)<500)))-69))^2;
f20=((max(cumsum(x( bp1(1,:)<550)))-75))^2;
f21=((max(cumsum(x( bp1(1,:)<600)))-82))^2;
f22=((max(cumsum(x( bp1(1,:)<650)))-87))^2;
f23=((max(cumsum(x( bp1(1,:)<700)))-92))^2;
 f=f5+f6+f7+f8+f9+f10+f11+f12+f13+f14+f15+f16+f17+f18+f19+f20+f21+f22+f23;
 f0=f1+f2+f3+f4;
 
fout2=f+f0;

end