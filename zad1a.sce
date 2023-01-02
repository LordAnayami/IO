//---- utworzenie termu "sredni" zmiennej
//---- lingwistycznej "wzrost"
X=zeros(5,181);
for i = 1:181
   
    x=i-1;
  X(1,i)=x;
 if i>=0 & i<=40
     awynik=(40-i)/40;
 else 
     awynik=0;
 end
 X(2,i)=awynik;
 
 
  if i>=20 & i<=40
      bwynik=(i-20)/20;
   elseif i>=40 & i<=60
      bwynik=1; 
  elseif i>=60 & i<=90
      bwynik=(90-i)/30;
  else 
      bwynik=0;
  end
  X(3,i)=bwynik;
  
 if i>=70 & i<=100
      cwynik=(i-70)/30;
 elseif i>=100 & i<=130
      cwynik=(130-i)/30;
  else
     cwynik=0;
 end
 X(4,i)=cwynik; 
      
  if i>=110 & i<=140
      dwynik=(i-110)/30;
   elseif i>=140 & i<=180
      dwynik=1; 
  else 
      dwynik=0;
  end
  X(5,i)=dwynik;  
      
   end 
    
 
 
//---- graficzna prezentacja termu "sredni"
plot(X(1,:),X(2,:),'r');
plot(X(1,:),X(3,:),'b');
plot(X(1,:),X(4,:),'g');
plot(X(1,:),X(5,:),'y');
mtlb_axis([0 180 0 1.2]);
xlabel('wzrost [cm]');
ylabel('u(wzrost)');
