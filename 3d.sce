//---- perceptron trenowanie
//---- okreslenie par wektorow trenujacych
//---- dla funktora AND
clc;
clear all;
A=ones(8,5);
A(1,2)=-1; A(1,3)=-1;A(1,4)=-1; A(1,5)=-1;
A(2,2)=-1; A(2,3)=-1; A(2,5)=-1;
A(3,2)=-1; A(3,4)=-1; A(3,5)=-1;
A(4,2)=-1;  A(4,5)=-1;
A(5,3)=-1;A(5,4)=-1; A(5,5)=-1;
A(6,3)=-1;
A(7,4)=-1; A(7,5)=-1;
A(8,5)=-1;


//---- ustalenie poczatkowych wartosci wag
W=[0 0 0 0];
//---- proces trenowania
disp(W);
Zmiana=1;
while (Zmiana==1)
 Zmiana=0;
 for i=1:8 //--- kolejno pobiera wektory trenujace
 S=A(i,1)*W(1)+A(i,2)*W(2)+A(i,3)*W(3)+A(i,4)*W(4);
 Sig=0;
 if S>0
 Sig=1;
 else
 Sig=-1;
 end
 if ((Sig>0) & (A(i,5)==1)) | ((Sig<0) & (A(i,5)==-1))
 W=W;
 else
 Zmiana=1;
 if (S~=0)
 for j=1:4
 W(j)=W(j)+0.5*(A(i,5)-Sig)*A(i,j);
 end
 end
 end
 if S==0
 Zmiana=1;
 for j=1:4
 W(j)=W(j)+(A(i,5)*A(i,j));
 end
 end
 disp(W);
 end
end
B=ones(1,5);
B(1,2) = input ("Podaj B2:");
B(1,3) = input ("Podaj B3:");
B(1,4) = input ("Podaj B4:");
S=B(1,1)*W(1)+B(1,2)*W(2)+B(1,3)*W(3)+B(1,4)*W(4);
if S>0
   disp("1"); 
elseif S<0
   disp("-1");
else
    disp("0");
end
disp(S);
