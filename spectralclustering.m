clear;

 data1=load('data1.mat');          % comment other part to access data1 and vice versa
 %data2=load('data2.mat');
 
 X=data1.X;
 %X=data2.X;
 [cluster1,cluster2]=specclustering(X);
 figure
 subplot(4,2,1)
 plot(cluster1(1,:),cluster1(2,:),'o',cluster2(1,:),cluster2(2,:),'*')
 [cluster11,cluster12]=specclustering(cluster1);
 subplot(4,2,2)
 plot(cluster11(1,:),cluster11(2,:),'d',cluster12(1,:),cluster12(2,:),'s')
 [cluster21,cluster22]=specclustering(cluster2);
 subplot(4,2,3)
 plot(cluster21(1,:),cluster21(2,:),'.',cluster22(1,:),cluster22(2,:),'x')
 [cluster111,cluster112]=specclustering(cluster11);
 subplot(4,2,4)
 plot(cluster111(1,:),cluster111(2,:),'^',cluster112(1,:),cluster112(2,:),'>')
 [cluster121,cluster122]=specclustering(cluster12);
 subplot(4,2,5)
plot(cluster121(1,:),cluster121(2,:),'<',cluster122(1,:),cluster122(2,:),'p')
[cluster211,cluster212]=specclustering(cluster21);
subplot(4,2,6)
plot(cluster211(1,:),cluster211(2,:),'h',cluster212(1,:),cluster212(2,:),'*')
[cluster221,cluster222]=specclustering(cluster22);
subplot(4,2,7)
plot(cluster221(1,:),cluster221(2,:),'.',cluster222(1,:),cluster222(2,:),'o')

MSE=0;
MSE2=0;
MSE3=0;
 MSD1=mean(cluster1,2);
 MSD2=mean(cluster11,2);
 MSD3=mean(cluster111,2);
 for i=1:size(cluster111,2)
     MSE=MSE+(norm(MSD1(:,1)-cluster1(:,i))^2);
     MSE2=MSE2+(norm(MSD2(:,1)-cluster11(:,i))^2);      %
     MSE3=MSE3+(norm(MSD3(:,1)-cluster111(:,i))^2);
 
 end
 
 var1=var(cluster1);
varsum1=sum(var1)/size(var1,2);      % variance criteria
var2=var(cluster11);
varsum2=sum(var2)/size(var1,2);
var3=var(cluster111);
varsum3=sum(var3)/size(var1,2);

Wmat1=var1*var1';
deter1=det(Wmat1);
Wmat2=var2*var2';                   % deteminant criteria
deter2=det(Wmat2);
Wmat3=var3*var3';
deter3=det(Wmat3);



