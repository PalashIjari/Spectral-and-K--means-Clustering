clear;
data1=load('data1.mat');
X=data1.X;
data2=load('data2.mat');
X2=data2.X;

reshaped=X';
reshaped2=X2';
[idx,C]  = kmeans(reshaped,2,'MaxIter',150,'replicates',5);  %change the second parameter for clusters and also change the plot accordingly
[idx2,C2]  = kmeans(reshaped2,8,'MaxIter',150,'replicates',5);
idx=reshape(idx,1,700);
idx2=reshape(idx2,1,1400);

conre=X';

%in = concat(:,3)<=2
 cluster1=[];
 cluster2=[];
 cluster3=[];
 cluster4=[];
 cluster5=[];
 cluster6=[];
 cluster7=[];
 cluster8=[];
 j=1;
 z=1;
 l=1;
 j1=1;
 j2=1;
 j3=l;
 j4=1;
 j5=1;
 for i=1:size(conre)
     if(idx(i)==1)
         cluster1(j,:)= conre(i,:);
         j=j+1;
     end
     if(idx(i)==2)
         cluster2(z,:)= conre(i,:);
        z=z+1;    
     end
     if(idx(i)==3)
         cluster3(l,:)= conre(i,:);
        l=l+1;    
     end
     if(idx(i)==4)
         cluster4(l,:)= conre(i,:);
        j1=j1+1;    
     end
     if(idx(i)==5)
         cluster5(l,:)= conre(i,:);
        j2=j2+1;    
     end
     if(idx(i)==6)
         cluster6(l,:)= conre(i,:);
        j3=j3+1;    
     end
     if(idx(i)==7)
         cluster7(l,:)= conre(i,:);
        j4=j4+1;    
     end
     if(idx(i)==8)
         cluster8(l,:)= conre(i,:);
        j5=j5+1;    
     end
 end
 cluster3=cluster3';
 cluster2=cluster2';
 cluster1=cluster1';
 cluster4=cluster4';
 cluster5=cluster5';
 cluster6=cluster6';
 cluster7=cluster7';
 cluster8=cluster8';
 
 cl1=[];
 a=1;
 b=1;
 c=1;
 d=1;
 e=1;
 f=1;
 g=1;
 h=1;
 cl2=[];
 cl3=[];
 cl4=[];
 c15=[];
 c16=[];
 c17=[];
 c18=[];
 for i=1:size(idx2')
     if(idx2(i)==1)
       cl1(a,:)=X2(:,i); 
       a=a+1;
     end
     if(idx2(i)==2)
       cl2(b,:)=X2(:,i);
       b=b+1;
     end
     if(idx2(i)==3)
       cl3(c,:)=X2(:,i);
       c=c+1;
     end
     if(idx2(i)==4)
       cl4(d,:)=X2(:,i);
       d=d+1;
     end
     if(idx2(i)==5)
       cl5(d,:)=X2(:,i);
       e=e+1;
     end
     if(idx2(i)==6)
       cl6(d,:)=X2(:,i);
       f=f+1;
     end
     if(idx2(i)==7)
       cl7(d,:)=X2(:,i);
       g=g+1;
     end
     if(idx2(i)==8)
       cl8(d,:)=X2(:,i);
       h=h+1;
     end
 end    
 cl1=cl1';
 cl2=cl2';
 cl3=cl3';
 cl4=cl4';
 c15=c15';
 c16=c16';
 c17=c17';
 c18=c18';
 %figure(1)
 %plot(cl1(1,:),cl1(2,:),'o',cl2(1,:),cl2(2,:),'x',cl3(1,:),cl3(2,:),'d',cl4(1,:),cl4(2,:),'*',cl5(1,:),cl5(2,:),'>',cl6(1,:),cl6(2,:),'<',cl7(1,:),cl7(2,:),'^',cl8(1,:),cl8(2,:),'p')
 %figure(2)
 %plot(cluster1(1,:),cluster1(2,:),'o',cluster2(1,:),cluster2(2,:),'x',cluster3(1,:),cluster3(2,:),'-',cluster4(1,:),cluster4(2,:),'+',cluster5(1,:),cluster5(2,:),'d',cluster6(1,:),cluster6(2,:),'<',cluster7(1,:),cluster7(2,:),'>',cluster8(1,:),cluster8(2,:),'p')
 plot(cluster1(1,:),cluster1(2,:),'o',cluster2(1,:),cluster2(2,:),'x')


%mean square error for cluster1 when data1.x is divided into 2 clusters is
%6.696e+04 and when divided into 4 clusters is 1.861e+04 and when divided
%into 8 clusters is 5.7611e+03
 MSE=0;
 MSD=C';
 for i=1:size(cluster1,2)
     MSE=MSE+(norm(MSD(:,1)-cluster1(:,i))^2);
 
 end
 
 %mean square error for cluster1 when data2.X is divided into 8 clusters i
 %6.44e+04 4 and 2 clusters is same as 8
 MSD2=C2';
 for i=1:size(cl1,2)
     MSE2=MSE+(norm(MSD(:,1)-cl1(:,i))^2);
 
 end

var1=var(cl1);
varsum=sum(var1)/size(var1,2);
Wmat=var1*var1';
deter=det(Wmat);

%sum of variances of cluster1 when data1.X is divided into two clusters
%5.625e+04,4.0852e+04,
%var2=var(cluster1);
%plot(var1(1,:),'*')


