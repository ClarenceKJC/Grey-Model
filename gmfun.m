function f =fun(N)
x0=N';
b=length(x0);
for i=2:b
    A(i)=x0(i)/x0(i-1);        %���ȼ���
end
B=A(2:b);                        %����        
if B>exp(-2/9)&B<exp(2/9)        %���ȿ����Է��������㼶�ȡʣ�exp(-2/(n+1),exp(2/(n+1)))��ʱ���ɽ��У����߽������ݴ���      
x1=cumsum(x0);                   %һ���ۼ�ֵ
for i=1:b-1
    ave(i)=1/2*(x1(i)+x1(i+1));
end
ave;                        
z=ave';                             %ƽ��ֵ @ȡ0.5
a=ones(b-1,1);
B=[-z,a];                  %���ݾ���B
Y=x0;
Y(:,1)=[];                   %�����������ɾ���x0ɾ����һ�еã�
c=B';                       %g=inv((B'B))B'Y  (���a u)
s=c*B;
d=inv(s);
f=d*c;
g=f*Y';                          %g=(a,u)'
h=g(1,1);                    %hʵ��Ϊa
u=g(2,1);
j=u/h;                       %Ԥ��ֵ=��x(1)-u/h��e +u/h
k=x0(1,1);
l=k-j;
for i=1:(b-1)
    yuc(i)=l*exp(-h*i)+j;                            
end                             %Ԥ��ģ�ͱ��ʽ
yuc;
x0(1,1);
yuce=[x0(1,1) yuc];              %û���ۼ�ʱ��Ԥ��ֵ
for i=1:b-1
    yce(i)=yuce(1,i+1)-yuce(1,i);
end
yce;                              %ȱ�ٵ�һ�����ݵ�Ԥ������
x0(1,1);
ycz=[x0(1,1) yce];                  %����Ԥ��ֵ(ֻ�Ƕ�ԭ���ݵ����ֵ)
ycz;
for i=1:b                           %�����У��
    cancha(i)=x0(i)-ycz(i);
end
cancha;                              %�в��ʼֵ-Ԥ��ֵ��
x2=mean(x0);                         %��ʼֵ��ƽ��ֵ
x3=mean(cancha);                     %�в�ƽ��ֵ
s=sum((x0-x2).^2)/b;                  %ʵ��ֵ����
t=sum((cancha-x3).^2)/b;              %�в��
s1=sqrt(s);                            %ʵ��ֵ������
s2=sqrt(t);                            %�в������
m=s2/s1;                              %������ֵ��Ԥ��ֵ��ʵ��ֵ����ɢ�̶ȣ�ԽСԽ�ã�
s0=0.6745*s1;                           %����ֵ0.6745s1
p1=abs(cancha-x3);                        %С���  p=p{|��(k)-��ƽ��ֵ|<0.6745s1}
n=0;                                   %����p1<s0�ĸ���n
for i=1:b
    if p1(i)<s0
        n=n+1;
    else n=n;
    end
end
n;
p=n/b;                                   %С�����ʣ�Խ��Խ�ã�
if p>0.95&m<0.35
    %Ԥ�⾫�Ⱥ�(һ��)')
    H=0;
elseif p<=0.7&m>=0.65
    %Ԥ�⾫�Ȳ��ϸ�,����ģ�͸Ľ�')
    H=1;
    
ca0=abs(cancha(1:b-2));
x11=cumsum(ca0);                   
b1=length(ca0);
for i=1:b1-1
    ave1(i)=1/2*(x11(i)+x11(i+1));
end
ave1 ;                      
z1=ave1';                             %ƽ��ֵ @ȡ0.5
a1=ones(b1-1,1);
B1=[-z1,a1] ;                 %���ݾ���B
Y1=ca0;
Y1(:,1)=[]  ;                 %�����������ɾ���x0ɾ����һ�еã�
c1=B1';                       %g=inv((B'B))B'Y  (���a u)
s1=c1*B1;
d1=inv(s1);
f1=d1*c1;
g1=f1*Y1';                          %g=(a,u)'
h1=g1(1,1);                    %hʵ��Ϊa
u1=g1(2,1);
j1=u1/h1 ;                      %Ԥ��ֵ=��x(1)-u/h��e +u/h
k1=ca0(1,1);
l1=k1-j1;
for i=1:(b1-1)
    yuc1(i)=l1*exp(-h1*i)+j1;                            
end                             %Ԥ��ģ�ͱ��ʽ
yuc1;
ca0(1,1);
yuce1=[ca0(1,1) yuc1];              %û���ۼ�ʱ��Ԥ��ֵ
for i=1:b1-1
    yce1(i)=yuce1(1,i+1)-yuce1(1,i);
end
yce1;                              %ȱ�ٵ�һ�����ݵ�Ԥ������
ca0(1,1);
ycz1=[ca0(1,1) yce1] ;                 %����Ԥ��ֵ(ֻ�Ƕ�ԭ���ݵ����ֵ)
ycz1;
o1=1;   %input('����Ԥ�����')
for i=b1:b1+o1-1
    yuc1(i)=l1*exp(-h1*i)+j1;                            
end
yuc1;
yucezhi11=yuc1(b1-1:b1+o1-1) ;             %û���ۼ�ʱ��δ��Ԥ��ֵ
for i=1:o1
    yucezhi21(i)=yucezhi11(i+1)-yucezhi11(i);
end
yucezhi21 ;                            %����Ԥ��ֵ

elseif p>0.8&m<0.5
    %'Ԥ�⾫�Ⱥϸ񣨶�����')
    H=0;
else
    %'Ԥ�⾫����ǿ�ϸ�')
    H=0;
end
o=1;%input('����Ԥ�����');
for i=b:b+o-1
    yuc(i)=l*exp(-h*i)+j;                            
end
yuc;
yucezhi1=yuc(b-1:b+o-1);              %û���ۼ�ʱ��δ��Ԥ��ֵ
for i=1:o
    yucezhi2(i)=yucezhi1(i+1)-yucezhi1(i);
end
yucezhi2 ;                             %����Ԥ��ֵ
else                                   %���Ȳ�����Ҫ�󣬽������ݴ���
    for i=1:b
        y0(i)=log10(log10(x0(i)));
    end
    H=2;
    y0;                                %�������ζ���������ԭʼ����
end
switch H
 case 0
    yc=yucezhi2;
 case 1
    yc=yucezhi21+yucezhi2;         %������Ԥ��ֵ
 case 2
    yc=mean(x0);
end

f=yc;

end