//---- perceptron trenowanie
//---- okreslenie par wektorow trenujacych
//---- dla funktora AND
A=ones(12,4);
A(1,2)=-1; A(1,3)=-1;A(1,4)=-1;
A(2,2)=-1;
A(3,3)=-1;
A(4,4)=-1;
A(5,2)=0.9; A(5,3)=0.9;A(5,4)=-1;
A(6,2)=0.9; A(6,3)=0.8;A(6,4)=-1;
A(7,2)=0.8; A(7,3)=0.9;A(7,4)=-1;
A(8,2)=0.95; A(8,3)=0.95;A(8,4)=-1;
A(9,2)=0.95; A(9,3)=0.9;A(9,4)=-1;
A(10,2)=-0.8; A(10,3)=0.8;
A(11,2)=-0.85; A(11,3)=0.9;
A(12,2)=0.8; A(12,3)=-0.8;
//---- wykreslenie obszaru klasyfikacji
for i=1:12
if A(i,4)==1
plot(A(i,2),A(i,3),'ko:');
else
plot(A(i,2),A(i,3),'r+:');
end
end
mtlb_axis([-2 2 -2 2])
//---- ustalenie poczatkowych wartosci wag
W=[0 0 0];
ItW=0;
Wk=[0 0 0];
ItWk=0;
PKW=0;
PKWk=0;
//---- proces trenowania
disp(W);
//Zmiana=1;
Iteracje=100;
Iter=0;
while (Iter<100)
Iter=Iter+1;
//Zmiana=0;
// for i=1:4 //--- kolejno pobiera wektory trenujace
i=round(rand()*11)+1;
S=A(i,1)*W(1)+A(i,2)*W(2)+A(i,3)*W(3);
Sig=0;
if S>0
Sig=1;
else
Sig=-1;
end
if ((Sig>0) & (A(i,4)==1)) | ((Sig<0) & (A(i,4)==-1))
W=W;
ItW=ItW+1;
if ItW>ItWk
PKW=0;
for k=1:12
S=A(k,1)*W(1)+A(k,2)*W(2)+A(k,3)*W(3);
if S>0
Uw=1;
elseif S<0
Uw=-1;
else
Uw=0;
end
if Uw==A(k,4)
PKW=PKW+1;
end
end
if PKW>PKWk
Wk=W;
ItWk=ItW;
PKWk=PKW;
end
end
else
Zmiana=1;
if (S~=0)
for j=1:3
W(j)=W(j)+0.5*(A(i,4)-Sig)*A(i,j);
end
end
end
if S==0
Zmiana=1;
for j=1:3
W(j)=W(j)+(A(i,4)*A(i,j));
end
end
disp(W);
//end
end
//---- wykreslenie otrzymanej linii podzialu
k=0;
W=Wk;
for i=-2:0.01:2
k=k+1;
XX(k)=i;
YY(k)=-((W(2)/W(3))*i)-(W(1)*1)/W(3);
end
plot(XX,YY);
mtlb_axis([-2 2 -2 2])
