//---- funkcja XOR
//---- algorytm wstecznej propagacji bledu
clear;
A(1,1)=1; A(1,2)=0; A(1,3)=0; A(1,4)=0;
A(2,1)=1; A(2,2)=0; A(2,3)=1; A(2,4)=1;
A(3,1)=1; A(3,2)=1; A(3,3)=0; A(3,4)=1;
A(4,1)=1; A(4,2)=1; A(4,3)=1; A(4,4)=0;
//---- wykreslenie obszaru klasyfikacji
Licz=0;
IleKrokow=50000;

//---- utworzenie odpowiednich tablic na dane
W=zeros(1,9); S=zeros(1,3); U=zeros(1,3); F=zeros(1,3); d=zeros(1,3);
//---- losowa inicjalizacja wag poczatkowych
for i=1:9
 W(i)=rand()-0.5;
end
ro=0.2;
iteracja=0;
while (iteracja<IleKrokow)
iteracja=iteracja+1;
//---- losowe wybieranie wektora trenujacego
i=round(rand()*3)+1;
//---- faza propagacji w przod - warstwa posrednia
S(1)=W(1)*A(i,1)+W(2)*A(i,2)+W(3)*A(i,3);
S(2)=W(4)*A(i,1)+W(5)*A(i,2)+W(6)*A(i,3);
U(1)=1/(1+exp(-S(1)));
U(2)=1/(1+exp(-S(2)));
//---- faza propagacji w przod - warstwa wyjsciowa
S(3)=W(7)*A(i,1)+W(8)*U(1)+W(9)*U(2);
U(3)=1/(1+exp(-S(3)));
//---- faza propagacji wstecz - warstwa wyjsciowa
F(3)=U(3)*(1-U(3));
d(3)=(A(i,4)-U(3))*F(3);
//---- faza propagacji wstecz - warstwa posrednia
F(1)=U(1)*(1-U(1));
d(1)=W(8)*d(3)*F(1);
F(2)=U(2)*(1-U(2));
d(2)=W(9)*d(3)*F(2);
//---- uaktualnienie wag - warstwa wyjsciowa
W(7)=W(7)+(ro*d(3)*A(i,1));
W(8)=W(8)+(ro*d(3)*U(1));
W(9)=W(9)+(ro*d(3)*U(2));
//---- uaktualnienie wag - warstwa posrednia
W(1)=W(1)+(ro*d(1)*A(i,1));
W(2)=W(2)+(ro*d(1)*A(i,2));
W(3)=W(3)+(ro*d(1)*A(i,3));
W(4)=W(4)+(ro*d(2)*A(i,1));
W(5)=W(5)+(ro*d(2)*A(i,2));
W(6)=W(6)+(ro*d(2)*A(i,3));
end





//----ponowne wykreślenie obszoru klasyfikacji

for i=1:4
 if A(i,4)==1
 plot(A(i,2),A(i,3),'ko:');
 else
 plot(A(i,2),A(i,3),'r+:');
 end
end

//---- wykreslenie otrzymanej linii podzialu (neuron 1)
k=0;
for i=-2:0.01:2
k=k+1;
XX(k)=i;
YY(k)=-((W(2)/W(3))*i)-(W(1)*1)/W(3);
end
plot(XX,YY,'r');
//---- wykreslenie otrzymanej linii podzialu (neuron 2)
k=0;
for i=-2:0.01:2
k=k+1;
XX(k)=i;
YY(k)=-((W(5)/W(6))*i)-(W(4)*1)/W(6);
end
plot(XX,YY,'b');
mtlb_axis([-0.5 1.5 -0.5 1.5]);




//====dodanie możliwości wprowadzenia nowej "wartości"
x=0;
while x<1
    B=ones(1,4);
B(1,2) = input ("Podaj B2:");
B(1,3) = input ("Podaj B3:");

S(1)=W(1)*B(1,1)+W(2)*B(1,2)+W(3)*B(1,3);
S(2)=W(4)*B(1,1)+W(5)*B(1,2)+W(6)*B(1,3);

if S(1)>0&S(2)<0
   disp("0"); 
elseif S(2)>0&S(1)<0
   disp("0");
else
    disp("1");
end

x = input ("Czy zakończyć T=1, N=0");
end
