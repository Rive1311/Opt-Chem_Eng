load ('datain.mat')
d=rmmissing(in(2,2:end)); %density
cp=rmmissing(in(4,2:end)); %carbon percentage
hp=rmmissing(in(5,2:end)); %hydrogen
op=rmmissing(in(6,2:end)); %oxygen
np=rmmissing(in(7,2:end)); %nitrogem
n=length(d); %number of components
tc0=in(16,9); %carbon target
th0=in(17,9); %hydrogen target
to0=in(18,9); %oxygen target
tn0=in(19,9); %nitrogen target
Fp=in(20,9); %protein target
Fc=in(21,9); %carbohydrates target
Fl=in(22,9); %lipid target
Flg=in(23,9); %lignin target
tot=in(18,4); %sum of components target
