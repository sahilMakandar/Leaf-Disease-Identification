function [itrfin] = multisvm( T,C,test )
%Inputs: T=Training Matrix, C=Group, test=Testing matrix
%Outputs: itrfin=Resultant class

itrind=size(test,1);
fprintf('itrind = %i\n',itrind);
itrfin=[];
fprintf('itrfin = %i   ',itrfin);
fprintf('\n');
Cb=C;
fprintf('Cb = %i   ', Cb);
fprintf('\n');
Tb=T;
fprintf('Tb = %i   ',Tb);
fprintf('\n');
for tempind=1:itrind
    fprintf('in %i st for tempind = %i , itrind = %i   ',tempind,tempind,tempind);
    fprintf('\n');
    tst=test(tempind,:);
    fprintf('tst = %i   ',tst);
    fprintf('\n');
    C=Cb;
    T=Tb;
    u=unique(C);
    fprintf('u = %i   ',u);
    fprintf('\n');
    N=length(u);
    fprintf('N = %i   ',N);
    fprintf('\n');
    c4=[];
    fprintf('c4 = %i   ',c4);
    fprintf('\n');
    c3=[];
    fprintf('c3 = %i   ',c3);
    fprintf('\n');
    j=1;
    k=1;
    if(N>2)
        itr=1;
        classes=0;
        cond=max(C)-min(C);
        fprintf('in if condition cond = %i   ',cond);
        fprintf('\n');
        while((classes~=1)&&(itr<=length(u))&& size(C,2)>1 && cond>0)
            fprintf('\n\nin while condition:-------------------------------------------------------------------------\n classes = %i  itr = %i size(C,2) = %i  cond = %i',classes,itr,size(C,2),cond);
            fprintf('\n');
        %This while loop is the multiclass SVM Trick
            c1=(C==u(itr));
            fprintf('c1 = %i   ',c1);
            fprintf('\n');
            newClass=c1;
            fprintf('newclass = %i   ',newClass);
            fprintf('\n');
            %svmStruct = svmtrain(T,newClass,'kernel_function','rbf'); % I am using rbf kernel function, you must change it also
            svmStruct = svmtrain(T,newClass);
            %fprintf('svmStruct = %i   ',svmStruct);
            %fprintf('\n');
            classes = svmclassify(svmStruct,tst);
            fprintf('classes = %i   ',classes);
            fprintf('\n');
            % This is the loop for Reduction of Training Set
            for i=1:size(newClass,2)
                fprintf('\nin 2nd for loop:\nitration i = %i to %i',i,size(newClass,2));
                fprintf('\n');
                fprintf('check newclass(1,i) element %i is 0',newClass(1,i));
                fprintf('\n');
                if newClass(1,i)==0;
                    c3(k,:)=T(i,:);
                    fprintf('then in T index at %i to last element attach in c3 from %i to last', i,k);
                    fprintf('\n');
                    k=k+1;
                end
            end
        T=c3;
        fprintf('New reduction training set:\n ');
        fprintf('T = %i   ', T);
        c3=[];
        k=1;
        
            % This is the loop for reduction of group
            for i=1:size(newClass,2)
                fprintf('\nin 3rd for loop:\nitration i = %i to %i',i,size(newClass,2));
                fprintf('\n');
                fprintf('check newclass(1,i) element %i is 0',newClass(1,i));
                fprintf('\n');
                if newClass(1,i)==0;
                    c4(1,j)=C(1,i);
                    fprintf('then in c4 index at %i  element replace to  C at index %i to last', j,i);
                    fprintf('\n');
                    j=j+1;
                end
            end
        C=c4;
        fprintf('New reduction Group set:\n ');
        fprintf('C = %i   ', C);
        fprintf('\n');
        c4=[];
        j=1;
        
        cond=max(C)-min(C); % Condition for avoiding group 
                            %to contain similar type of values 
                            %and the reduce them to process
        fprintf('check condition cond = %i', cond);
        fprintf('\n');
            % This condition can select the particular value of iteration
            % base on classes
            if classes~=1
                itr=itr+1;
            end    
        end
    end

valt=Cb==u(itr);
fprintf('\n\noutside while:\n');
fprintf('valt = %i   ',valt);
fprintf('\n');
% This logic is used to allow classification
val=Cb(valt==1);
fprintf('val = %i   ',val);
fprintf('\n');
% of multiple rows testing matrix
val=unique(val);
fprintf('val = %i   ',val);
fprintf('\n');
itrfin(tempind,:)=val;  
fprintf('itrfin(tempind,:) = %i  ',itrfin(tempind,:));
fprintf('\n');
end

end



