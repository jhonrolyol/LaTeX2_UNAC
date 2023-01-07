clear()
r=2 //coordenda generalizada
h=4 //velocidad generalizada

m2=0.5 //Masa del carro
m1=0.2 //Masa del pendulo
g=9.81 //Gravedad
l=0.25 //Longitud del pendulo
u=0.5 //Fuerza externa

Tf=25 //Tiempo final
pi=3.14159265359

function dx=F(t,x)
    dx=[x(3);x(4);(u+m1*l*sin(x(2))*(x(4).^2)-m1*g*sin(x(2))*cos(x(2)))/(m2+m1-m1*(cos(x(2)))^2);(u*cos(x(2))-(m1+m2)*g*sin(x(2))+m1*l*sin(x(2))*cos(x(2))*x(4).^2)/(m1*l*(cos(x(2)))^2-(m1+m2)*l)]
endfunction

t0=0;
t=0:0.001:Tf;
x1=ode([0.001;1.00001;0;0],t0,t,F);
x2=ode([0.002;1.00002;0;0],t0,t,F)

d0=sqrt((x1(r,1)-x2(r,1)).^2+(x1(h,1)-x2(h,1)).^2)
l(1)=0
for i=2:length(t)
    d=sqrt((x1(r,i)-x2(r,i)).^2+(x1(h,i)-x2(h,i)).^2)
    l(1,i)=d
    l(2,i)=log(d/d0)/t(i)
end    

b=x2(r,:).*l(r,:)  //Angulo estable

figure(1)
xgrid
xlabel('tiempo (seg)')
ylabel('$\theta$')
plot(t,b,'r-') //Angulo estable

figure(2)
xgrid
xlabel('tiempo (seg)')
ylabel('$\lambda$')
plot(t,l(r,:),'b-') //Exponente de Liapunov
