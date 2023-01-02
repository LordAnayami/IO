//---- utworzenie termu "sredni" zmiennej
//---- lingwistycznej "wzrost"
clc;
clear;
X=zeros(6,101);
for i = 1:101
   
   x=i-1;
   X(1,i)=x;
 if x>=30 & x<=40
      awynik=(x-30)/10;
 elseif x>=40 & x<=50
      awynik=(50-x)/10;
  else
     awynik=0;
 end
 
 
 X(2,i)=awynik; 
 
 
 if x>=40 & x<=60
      bwynik=(x-40)/20;
 elseif x>=60 & x<=70
      bwynik=(70-x)/10;
  else
     bwynik=0;
 end
    
  X(3,i)=bwynik; 
  
  
  X(4,i)=min(awynik,bwynik);
  X(5,i)=max(awynik,bwynik);
  X(6,i)=1-bwynik;
     
  
  end 
 
//---- graficzna prezentacja termu "sredni"
plot(X(1,:),X(2,:),'r');
plot(X(1,:),X(3,:),'b');
plot(X(1,:),X(4,:),'g');
plot(X(1,:),X(5,:),'y');
plot(X(1,:),X(6,:),'o');
mtlb_axis([0 100 0 1.2]);
xlabel('wzrost [cm]');
ylabel('u(wzrost)');
