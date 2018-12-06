clear;close all;clc;
i1=im2double(imread('T1.jpg'));
i2=im2double(imread('T2.jpg'));
n=size(i1(:),1);
factor=10/255;
corr=zeros(21,1);
qmi=zeros(21,1);
for tx=-10:10
	i2shift=zeros(size(i2));
	if(tx==0)
		i2shift=i2;
	end
	if(tx>0)
		i2shift(:,tx+1:end)=i2(:,1:end-tx);
	end
	if(tx<0)
		i2shift(:,1:end+tx)=i2(:,-tx+1:end);
	end
	m1=mean(i1(:));
	m2=mean(i2shift(:));
	num=sum((i1(:)-m1) .* (i2shift(:)-m2));
	denom=sqrt(sum((i1(:)-m1).^2) * sum((i2shift(:)-m2).^2) );
	rho=num/denom;
	corr(tx+11)=rho;
	bins=zeros(26,26);
	putintobins=[floor(i1(:)/factor),floor(i2shift(:)/factor)];
	for i=1:26
		for j=1:26
			bins(i,j)=size(find(putintobins(:,1)==(i-1) & putintobins(:,2)==(j-1)),1)/n;
		end
	end
	for i=1:26
		for j=1:26
			bins(i,j)=(bins(i,j)-sum(bins(i,:))*sum(bins(:,j)))^2;
		end
	end
	qmi(tx+11)=sum(sum(bins));
end
figure(1);
plot([-10:10],corr);
title('Correlation coefficient \rho vs. t_x for first part');
xlabel('t_x');
ylabel('\rho');
figure(2);
plot([-10:10],qmi);
title('QMI vs. t_x for first part');
xlabel('t_x');
ylabel('QMI');


i2=1-i1;
n=size(i1(:),1);
factor=10/255;
corr=zeros(21,1);
qmi=zeros(21,1);
for tx=-10:10
	i2shift=zeros(size(i2));
	if(tx==0)
		i2shift=i2;
	end
	if(tx>0)
		i2shift(:,tx+1:end)=i2(:,1:end-tx);
	end
	if(tx<0)
		i2shift(:,1:end+tx)=i2(:,-tx+1:end);
	end
	m1=mean(i1(:));
	m2=mean(i2shift(:));
	num=sum((i1(:)-m1) .* (i2shift(:)-m2));
	denom=sqrt(sum((i1(:)-m1).^2) * sum((i2shift(:)-m2).^2) );
	rho=num/denom;
	corr(tx+11)=rho;
	bins=zeros(26,26);
	putintobins=[floor(i1(:)/factor),floor(i2shift(:)/factor)];
	for i=1:26
		for j=1:26
			bins(i,j)=size(find(putintobins(:,1)==(i-1) & putintobins(:,2)==(j-1)),1)/n;
		end
	end
	for i=1:26
		for j=1:26
			bins(i,j)=(bins(i,j)-sum(bins(i,:))*sum(bins(:,j)))^2;
		end
	end
	qmi(tx+11)=sum(sum(bins));
end
figure(3);
plot([-10:10],corr);
title('Correlation coefficient \rho vs. t_x for second part');
xlabel('t_x');
ylabel('\rho');
figure(4);
plot([-10:10],qmi);
title('QMI vs. t_x for second part');
xlabel('t_x');
ylabel('QMI');