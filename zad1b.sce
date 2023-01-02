//---- utworzenie termu "sredni" zmiennej
//---- lingwistycznej "wzrost"
X=zeros(5,361);
for i = 1:361
   
    
  X(1,i)=i/2;
 if (i/2)>=0 & (i/2)<=40
     awynik=(40-i/2)/40;
 else 
     awynik=0;
 end
 X(2,i)=awynik;
 
 
  if (i/2)>=20 & (i/2)<=40
      bwynik=(i/2-20)/20;
   elseif (i/2)>=40 & (i/2)<=60
      bwynik=1; 
  elseif (i/2)>=60 & (i/2)<=90
      bwynik=(90-i/2)/30;
  else 
      bwynik=0;
  end
  X(3,i)=bwynik;
  
 if (i/2)>=70 & (i/2)<=100
      cwynik=(i/2-70)/30;
 elseif (i/2)>=100 & (i/2)<=130
      cwynik=(130-i/2)/30;
  else
     cwynik=0;
 end
 X(4,i)=cwynik; 
      
  if (i/2)>=110 & (i/2)<=140
      dwynik=(i/2-110)/30;
   elseif (i/2)>=140 & (i/2)<=180
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
