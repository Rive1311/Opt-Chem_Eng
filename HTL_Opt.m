clear;
s=readmatrix('HTL_Data.xlsx','Sheet',1);
save datasewage s
in=readmatrix('HTL_Data.xlsx','Sheet',2);
save datain in
options=optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',5e+05,'OptimalityTolerance',1e-03,'Display','final');
h = input('Choose Algorithm: ');
% 1 -> FMINCON In
% 2 -> Firefly In
% 3 -> FMINCON Out
% 4 -> Firefly Out

switch h
    case 1
          Data_In;
x0=fmincon(@F_In,rand(1,n),[],[],ones(1,n),tot,zeros(1,n),100*ones(1,n),[],options);
a=100*[sum(x0(10:16))/sum(x0),sum(x0(1:3))/sum(x0),sum(x0(4:9))/sum(x0),sum(x0(17:20))/sum(x0)];
b=[sum(x0.*cp),sum(x0.*hp),sum(x0.*op),sum(x0.*np)]/(tot/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)
fprintf(' Protein %.2f \n Carbohydrates %.2f \n Lipid %.2f \n Lignin %.2f \n',a)
 writematrix(x0,'HTL_Data.xlsx','Sheet',2,'Range','B11')
 writematrix(1/sum(x0/d),'HTL_Data.xlsx','Sheet',2,'Range','G26')
    case 2
        Data_In;
        x0=FA_In ;
a=100*[sum(x0(10:16))/sum(x0),sum(x0(1:3))/sum(x0),sum(x0(4:9))/sum(x0),sum(x0(17:20))/sum(x0)];
b=[sum(x0.*cp),sum(x0.*hp),sum(x0.*op),sum(x0.*np)]/(tot/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)
fprintf(' Protein %.2f \n Carbohydrates %.2f \n Lipid %.2f \n Lignin %.2f \n',a)
        writematrix(x0,'HTL_Data.xlsx','Sheet',2,'Range','B29')
        writematrix(1/sum(x0/d),'HTL_Data.xlsx','Sheet',2,'Range','G41')
    case 3
  Data_Out;
x1=fmincon(@F_Out,rand(1,n1),[],[],ones(1,n1),tot1,zeros(1,n1),100*ones(1,n1),[],options);
writematrix(x1,'HTL_Data.xlsx','Sheet',1,'Range','B11');
b=[sum(x1.*cp1),sum(x1.*hp1),sum(x1.*op1),sum(x1.*np1)]/(tot1/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)
hold on
plot(bpopt,xopt)
plot(bp1,cumsum(x1/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected','Optimized')

    case 4
         Data_Out;
x1=FA_Out;
b=[sum(x1.*cp1),sum(x1.*hp1),sum(x1.*op1),sum(x1.*np1)]/(tot1/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)
hold on 
plot(bpopt,xopt)
plot(bp1,cumsum(x1/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected','Optimized')

    otherwise
        disp('Please choose betwenn 1,2,3,4')
   HTL_Opt
end