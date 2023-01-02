clc;
clear;
X=zeros(4,101);
for i = 1:101
   
   x=(i-1)/2;
   X(1,i)=x;
 if  x<=20
      awynik=1;
 elseif x>=20 & x<=30
      awynik=(30-x)/10;
  else
     awynik=0;
 end
 
 X(2,i)=awynik;
 
 if  x>=20 & x<=30
      bwynik=(x-20)/10;;
 elseif x>=30 & x<=40
      bwynik=(40-x)/10;
  else
     bwynik=0;
 end
 
 X(3,i)=bwynik;
 
 if  x>=40
      cwynik=1;
 elseif x>=30 & x<=40
      cwynik=(x-30)/10;
  else
     cwynik=0;
 end
 
 X(4,i)=cwynik;
 end
 
 //czesc b
 

 

Y=zeros(4,101);
for i = 1:101
   
   y=(i-1);
   Y(1,i)=y;
   
if y<=50
      dwynik=(50-y)/50;
  else
     dwynik=0;
 end
 
 Y(2,i)=dwynik;
 
 if  y>=20 & y<=60
      ewynik=(y-20)/40;;
 elseif y>=60 & y<=80
      ewynik=(80-y)/20;
  else
     ewynik=0;
 end
 
 Y(3,i)=ewynik;
 
 if y>=60
      fwynik=(y-60)/40;
  else
     fwynik=0;
 end
 
 Y(4,i)=fwynik;

end

//c gdzie N2 - A(X) itd...
n=input('Podaj wartosc x: ') ;
N=zeros(4,1);
N(1,1)=n;
n=n*2+1;
N(2,1)=X(2,n);
N(3,1)=X(3,n);
N(4,1)=X(4,n);


//d
Z=zeros(5,101);
for i = 1:101
Z(1,i)=X(1,i);
Z(2,i)=min(Y(2,i),N(2,1));
Z(3,i)=min(Y(3,i),N(3,1));
Z(4,i)=min(Y(4,i),N(4,1));


//e
Z(5,i)=max(Z(2,i),Z(3,i),Z(4,i));

end



//f
suma=0;
waga=0;

for i = 1:101
    if Z(5,i)>0
    suma=suma+Z(1,i)*Z(5,i);
    waga=waga+Z(5,i);

end
end
wynik=suma/waga;


disp(wynik);


plot(Z(1,:),Z(2,:),'y');
plot(Z(1,:),Z(3,:),'o');
plot(Z(1,:),Z(4,:),'x');
plot(Z(1,:),Z(5,:),'g');
mtlb_axis([0 100 0 1.2]);
xlabel('X');
ylabel('Y');


 
