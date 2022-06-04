clear;clc;
i=0;
s=readmatrix('HTL_Data.xlsx','Sheet',7);
save datasewage s
in=readmatrix('HTL_Data.xlsx','Sheet',6);
save datain in
all=readmatrix('HTL_Data.xlsx','Sheet',8);
save dataall all
name=readtable('HTL_Data.xlsx','Sheet',8);
save dataname name
up=readmatrix('HTL_Data.xlsx','Sheet',9);
save dataupgraded up
a=name.Properties.VariableNames;
a(:,1)=[];
options=optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',5e+05,'OptimalityTolerance',1e-03);
options1=optimoptions('lsqnonlin','Algorithm','levenberg-marquardt','MaxFunctionEvaluations',5e+05,'FunctionTolerance',1e-10);
h = input('Choose Algorithm: ');
% 1 -> SQP
% 2 -> Firefly 
% 3 -> Least Squares
% 4 -> PSO

switch h
   
    
    case 1               %SQP

        
Data_In;                %Biomass
x0=fmincon(@F_In,rand(1,n),[],[],ones(1,n),tot,zeros(1,n),100*ones(1,n),[],options);

for i=1:n
    if x0(i)<0.0001
        x0(i)=0;
    end
end


a=100*[sum(x0(11:17))/sum(x0),sum(x0(1:4))/sum(x0),sum(x0(5:10))/sum(x0),sum(x0(18:21))/sum(x0)];
b=[sum(x0.*cp),sum(x0.*hp),sum(x0.*op),sum(x0.*np)]/(tot/100);

fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)
fprintf(' Protein %.2f \n Carbohydrates %.2f \n Lipid %.2f \n Lignin %.2f \n',a)

writematrix(x0,'HTL_Data.xlsx','Sheet',1,'Range','B1')
writematrix(1/sum(x0/d),'HTL_Data.xlsx','Sheet',1,'Range','G13')



Data_Out;               %Biocrude
xo=fmincon(@F_Out,rand(1,n1),[],[],ones(1,n1),tot1,zeros(1,n1),100*ones(1,n1),[],options);

for i=1:n1
    if xo(i)<0.0001
        xo(i)=0;
    end
end

writematrix(xo,'HTL_Data.xlsx','Sheet',1,'Range','B17')
writematrix(1/sum(xo/d1),'HTL_Data.xlsx','Sheet',1,'Range','G24')

b=[sum(xo.*cp1),sum(xo.*hp1),sum(xo.*op1),sum(xo.*np1)]/(tot1/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)

hold on
plot(bpopt,xopt)
plot(bp1,cumsum(xo/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected','Optimized')



Data_Up;   %Updated Biocrude
xu=fmincon(@F_Up,rand(1,n1),[],[],ones(1,n1),tot1,zeros(1,n1),100*ones(1,n1),[],options);

for i=1:n1
    if xu(i)<0.0001
        xu(i)=0;
    end
end
b=[sum(xu.*cp1),sum(xu.*hp1),sum(xu.*op1),sum(xu.*np1)]/(tot1/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)

writematrix(xu,'HTL_Data.xlsx','Sheet',1,'Range','B26')
writematrix(1/sum(xu/d1),'HTL_Data.xlsx','Sheet',1,'Range','G35')
   
hold on
plot(bpopt,xopt)
plot(bp1,cumsum(xu/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected','Optimized')
    

     case 2             %Firefly

Data_In;                %Biomass
x0=FA_In ;

for i=1:n
    if x0(i)<0.0001
        x0(i)=0;
    end
end

a=100*[sum(x0(11:17))/sum(x0),sum(x0(1:4))/sum(x0),sum(x0(5:10))/sum(x0),sum(x0(18:21))/sum(x0)];
b=[sum(x0.*cp),sum(x0.*hp),sum(x0.*op),sum(x0.*np)]/(tot/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)
fprintf(' Protein %.2f \n Carbohydrates %.2f \n Lipid %.2f \n Lignin %.2f \n',a)

writematrix(x0,'HTL_Data.xlsx','Sheet',2,'Range','B1')
writematrix(1/sum(x0/d),'HTL_Data.xlsx','Sheet',2,'Range','G13')



Data_Out;               %Biocrude
xo=FA_Out;

for i=1:n1
    if xo(i)<0.0001
        xo(i)=0;
    end
end

b=[sum(xo.*cp1),sum(xo.*hp1),sum(xo.*op1),sum(xo.*np1)]/(tot1/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)

writematrix(xo,'HTL_Data.xlsx','Sheet',2,'Range','B17')
writematrix(1/sum(xo/d1),'HTL_Data.xlsx','Sheet',2,'Range','G24')
hold on 
plot(bpopt,xopt)
plot(bp1,cumsum(xo/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected','Optimized')


Data_Up;            %Updated Biocrude
xu=FA_Up;

for i=1:n1
    if xu(i)<0.0001
        xu(i)=0;
    end
end

b=[sum(xu.*cp1),sum(xu.*hp1),sum(xu.*op1),sum(xu.*np1)]/(tot1/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)

writematrix(xu,'HTL_Data.xlsx','Sheet',2,'Range','B26')
writematrix(1/sum(xu/d1),'HTL_Data.xlsx','Sheet',2,'Range','G35')
   
hold on 
plot(bpopt,xopt)
plot(bp1,cumsum(xu/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected','Optimized')


    
    
    case 3                  %Least Squares

       
Data_In;    %Biomass  
x0=lsqnonlin(@F_In,rand(1,n),zeros(1,n),100*ones(1,n),options1);

for i=1:n
    if x0(i)<0.0001
        x0(i)=0;
    end
end

a=100*[sum(x0(11:17))/sum(x0),sum(x0(1:4))/sum(x0),sum(x0(5:10))/sum(x0),sum(x0(18:21))/sum(x0)];
b=[sum(x0.*cp),sum(x0.*hp),sum(x0.*op),sum(x0.*np)]/(sum(x0)/100);

fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)
fprintf(' Protein %.2f \n Carbohydrates %.2f \n Lipid %.2f \n Lignin %.2f \n',a)
writematrix(x0,'HTL_Data.xlsx','Sheet',3,'Range','B1')
writematrix(1/sum(x0/d),'HTL_Data.xlsx','Sheet',3,'Range','G13')
  


Data_Out;                    %Biocrude
xo=lsqnonlin(@F_Out,rand(1,n1),zeros(1,n1),100*ones(1,n1),options1);

for i=1:n1
    if xo(i)<0.0001
        xo(i)=0;
    end
end
bo=[sum(xo.*cp1),sum(xo.*hp1),sum(xo.*op1),sum(xo.*np1)]/(sum(xo)/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',bo)

hold on
plot(bpopt,xopt)
plot(bp1,cumsum(xo/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected ','Optimized')
hold off

writematrix(xo,'HTL_Data.xlsx','Sheet',3,'Range','B17')
writematrix(1/sum(xo/d1),'HTL_Data.xlsx','Sheet',3,'Range','G24')



Data_Up;          %Updated Biocrude
xu=lsqnonlin(@F_Up,rand(1,n1),zeros(1,n1),100*ones(1,n1),options1);

for i=1:n1
    if xu(i)<0.0001
        xu(i)=0;
    end
end

bu=[sum(xu.*cp1),sum(xu.*hp1),sum(xu.*op1),sum(xu.*np1)]/(sum(xu)/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',bu)

figure
hold on
plot(bpopt,xopt)
plot(bp1,cumsum(xu/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected  Upgraded','Optimized Upgraded')
writematrix(xu,'HTL_Data.xlsx','Sheet',3,'Range','B26')
writematrix(1/sum(xu/d1),'HTL_Data.xlsx','Sheet',3,'Range','G35')
    
    
    case 4       %PSO

        
Data_In;        %Biomass

PSO_In;

x0=BestSol.Position;

for i=1:n
    if x0(i)<0.0001
        x0(i)=0;
    end
end

a=100*[sum(x0(11:17))/sum(x0),sum(x0(1:4))/sum(x0),sum(x0(5:10))/sum(x0),sum(x0(18:21))/sum(x0)];
b=[sum(x0.*cp),sum(x0.*hp),sum(x0.*op),sum(x0.*np)]/(sum(x0)/100);

fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',b)
fprintf(' Protein %.2f \n Carbohydrates %.2f \n Lipid %.2f \n Lignin %.2f \n',a)
writematrix(x0,'HTL_Data.xlsx','Sheet',4,'Range','B1')
writematrix(1/sum(x0/d),'HTL_Data.xlsx','Sheet',4,'Range','G13')
 

Data_Out;           %Biocrude

PSO_Out;

xo=BestSol.Position;

for i=1:n1
    if xo(i)<0.0001
        xo(i)=0;
    end
end

bo=[sum(xo.*cp1),sum(xo.*hp1),sum(xo.*op1),sum(xo.*np1)]/(sum(xo)/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',bo)

hold on
plot(bpopt,xopt)
plot(bp1,cumsum(xo/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected ','Optimized')
hold off

writematrix(xo,'HTL_Data.xlsx','Sheet',4,'Range','B17')
writematrix(1/sum(xo/d1),'HTL_Data.xlsx','Sheet',4,'Range','G24')


Data_Up;      %Updated Biocrude

PSO_Up;

xu=BestSol.Position;

for i=1:n1
    if xu(i)<0.0001
        xu(i)=0;
    end
end

bu=[sum(xu.*cp1),sum(xu.*hp1),sum(xu.*op1),sum(xu.*np1)]/(sum(xu)/100);
fprintf(' Carbon %.2f \n Hydrogen %.2f \n Oxygen %.2f \n Nitrogen %.2f \n',bu)

figure
hold on
plot(bpopt,xopt)
plot(bp1,cumsum(xu/100))
xlabel('Boiling Point °C');
ylabel('Recovered Mass fraction');
legend('Expected  Upgraded','Optimized Upgraded')

writematrix(xu,'HTL_Data.xlsx','Sheet',4,'Range','B26')
writematrix(1/sum(xu/d1),'HTL_Data.xlsx','Sheet',4,'Range','G35')
   
    otherwise
        
disp('Please choose betwenn 1-4')
HTL_Opt
end