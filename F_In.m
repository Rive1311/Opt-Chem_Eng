function f=hi(x)
Data_In;
f1=((tc0 - sum(x.*cp)/sum(x))/tc0).^2;
f2=((th0-  sum(x.*hp)/sum(x))/th0).^2;
f3=((to0 - sum(x.*op)/sum(x))/to0).^2;
f4=((tn0 - sum(x.*np)/sum(x))/tn0).^2;
f4=((Fp-100*(sum(x(10:16)))/sum(x))/Fp).^2;
f5=((Fl-100*(sum(x(4:9)))/sum(x))/Fl).^2;
f6=((Fc-100*(sum(x(1:3)))/sum(x))/Fc).^2;
f7=((Flg-100*(sum(x(17:20)))/sum(x))/Flg).^2;
f8=((1.2-1/sum((x/d)))/1.2).^2;
f0=f5+f6+f7+f8;
fa=f1+f2+f3+f4;
f=f0+fa;
end