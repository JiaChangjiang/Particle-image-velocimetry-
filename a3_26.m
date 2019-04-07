
[m,n]=size (u_filtered);
[a,b]=size (x{1,1});
data =rand(a,b,m);
data4=rand(a,b);
for i=1:m
        if (isempty(u_filtered{i,1}))
        datav(:,:,i)=0;
        continue;
        end
data(:,:,i)=u_filtered{i,1};
end
for j=1:a
    for k=1:b
        data4(j,k)=0;
    for i=1:m
       data4(j,k)=data(j,k,i)+data4(j,k);
    end
    data4(j,k)=data4(j,k)/m;
    end
end


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
[x1,y1]=size (x{1,1});
datax=rand(x1,y1);
datax=x{1,1};

datay=rand(x1,y1);
datay=y{1,1};
quiver(datax,datay,data4,data4v)

a1=reshape(datax,[a*b,1]);
b1=reshape(datay,[a*b,1]);
c1=reshape(data4,[a*b,1]);
d1=reshape(data4v,[a*b,1]);
finaldata={a1,b1,c1,d1};
data5=cell2mat(finaldata);

%%fid=fopen('second500.dat','w');
%%fprintf(fid,'Title = "zuoye2"\r\n');
%%fprintf(fid,'ARIABLES="X","Y","Vx","Vy"\r\n');
%%fprintf(fid,'%f,%f,%f,%f\r\n',data5');
%fclose(fid);

    for j=1:a
        for k=1:b
            for i = 1:250
   u1(j,k,i) = data(j,k,i)-data4(j,k);
   v1(j,k,i) = datav(j,k,i)-data4v(j,k);

            end
        end
    end
   
uu = u1.*u1;
uu_sum = sum(uu,3);
uu_ave = uu_sum/250;

uv = u1.*v1;
uv_ave = sum(uv,3)/250;

vv = v1.*v1;
vv_ave = sum(vv,3)/250;

uu_shape=reshape(uu_ave,[a*b,1]);
vv_shape=reshape(vv_ave,[a*b,1]);
uv_shape=reshape(uv_ave,[a*b,1]);

data6(:,1) = data5(:,1);
data6(:,2) = data5(:,2);
data6(:,3) = uu_shape;
data6(:,4) = vv_shape;
data6(:,5) = uv_shape;
data6(:,6) = data5(:,3);
data6(:,7) = data5(:,4);

fid = fopen('last3_26aftenoon.dat','w');
fprintf(fid,'Title = "last"\r\n');
fprintf(fid,'VARIABLES = "X","Y","uu","vv","uv","u","v"\r\n');
fprintf(fid,'ZONE T = "Frame0",I=56,J=98,K=1\r\n');
fprintf(fid,'%f %f %f %f %f %f %f\r\n',data6');
fclose(fid);
