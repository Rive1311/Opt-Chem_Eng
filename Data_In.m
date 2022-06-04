load ('datain.mat')
d=rmmissing(in(2,2:end));
cp=rmmissing(in(4,2:end));
hp=rmmissing(in(5,2:end));
op=rmmissing(in(6,2:end));
np=rmmissing(in(7,2:end));
n=length(d);
tc0=in(16,9);
th0=in(17,9);
to0=in(18,9);
tn0=in(19,9);
Fp=in(20,9);
Fc=in(21,9);
Fl=in(22,9);
Flg=in(23,9);
tot=in(18,4);