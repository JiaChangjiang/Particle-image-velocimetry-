%%���ݴ�С��ȡ
[m,n]=size (u_filtered);
[a,b]=size (u_filtered{1,1});
data =rand(a,b,m);
data4=rand(a,b);
%%���ݴ�cellд��mat
for i=1:m
        if (isempty(u_filtered{i,1}))%%���������Ƿ�Ϊ��
        datav(:,:,i)=0;
        continue;
        end
data(:,:,i)=u_filtered{i,1};
end
%%ѭ����ƽ��
for j=1:a
    for k=1:b
        data4(j,k)=0;
    for i=1:m
       data4(j,k)=data(j,k,i)+data4(j,k);
    end
    data4(j,k)=data4(j,k)/m;
    end
end
%%�ظ�������Vy��
[m,n]=size (v_filtered);
[a,b]=size (v_filtered{1,1});
datav =rand(a,b,m);
data4v=rand(a,b);
for i=1:m
    if (isempty(v_filtered{i,1}))
        datav(:,:,i)=0;
        continue;
    end
datav(:,:,i)=v_filtered{i,1};
end
for j=1:a
    for k=1:b
        data4v(j,k)=0;
    for i=1:m
       data4v(j,k)=datav(j,k,i)+data4v(j,k);
    end
    data4v(j,k)=data4v(j,k)/m;
    end
end
%%x,y����ͻ�ͼ
[x1,y1]=size (x{1,1});
datax=rand(x1,y1);
datax=x{1,1};
datay=rand(x1,y1);
datay=y{1,1};
quiver(datax,datay,data4,data4v)
axis tight
%%�����������
a1=reshape(datax,[a*b,1]);
b1=reshape(datay,[a*b,1]);
c1=reshape(data4,[a*b,1]);
d1=reshape(data4v,[a*b,1]);
finaldata={a1,b1,c1,d1};
data5=cell2mat(finaldata);
%%�ļ�д�벿��
fid=fopen('pivlab06.dat','w');
fprintf(fid,'Title = "zuoye1"\r\n');
fprintf(fid,'VARIABLES = "X","Y","Vx","Vy"\r\n');
fprintf(fid,'ZONE T="Frame 41",i=%d,j=%f,K=1\r\n',a,b);
fprintf(fid,'%f,%f,%f,%f\r\n',data5');
fclose(fid);
