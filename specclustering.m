

function [cluster1,cluster2]=specclustering(data)
 dim=size(data,2);
        W=zeros(dim);
              for i=1:dim
     
                   for j=1:dim
                   W(i,j)=exp(-(norm(data(:,i)-data(:,j))^2)*0.1);
                   
                   end
             
             
              end
        

        D=zeros(dim);
        for i=1:dim
        sum=0;
             for j=1:dim
                  sum=sum+W(i,j);
             end
        D(i,i)=sum;
        end
         L=D-W;
         K=0; 
        for i=1:dim
               K=K+L(1,i);
        end

        P=(D^-0.5)*L*(D^-0.5);
        [V,B]=eig(P);


        [~, ind]=sort(diag(B),'ascend'); % store the indices of which columns the sorted eigenvalues come from
        V2=V(:,ind); % arrange the columns in this order

        cluster1=[];
        cluster2=[];
        for i=1:dim
            if(V2(i,2)<0)
                  cluster1=[cluster1 data(:,i)];
            else
                  cluster2=[cluster2 data(:,i)];
        
            end
        
        end

end