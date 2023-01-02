//---- utworzenie termu "sredni" zmiennej
//---- lingwistycznej "wzrost"
wzrost=zeros(2,71);
for i = 1:71
 x=149+i;
 wzrost(1,i)=x;
 if x>=155 & x<=165
 sredni=(x-155)/(165-155);
 elseif x>165 & x<175
 sredni=1;
 elseif x>=175 & x<=185
 sredni=(185-x)/(185-175);
 else sredni=0;
 end
 wzrost(2,i) = sredni;
end
//---- graficzna prezentacja termu "sredni"
plot(wzrost(1,:),wzrost(2,:),'r');
mtlb_axis([150 220 0 1.2]);
xlabel('wzrost [cm]');
ylabel('u(wzrost)');

