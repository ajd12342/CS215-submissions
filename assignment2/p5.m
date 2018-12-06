clear;close all;clc;
k=2:1:25;
p=0.01;
y1=zeros(size(k));
for i=1:size(k,2)
    y1(i)=k(i)+1-k(i)*(1-p)^(k(i));
end
figure(1);
plot(k,k,k,y1)
title(['Expected no. of tests vs No. of people (p=' num2str(p) ')']);
xlabel('No. of people (k)')
ylabel('Expected no. of tests')
legend('Method 1','Method 2','Location','southeast')
p=0.1;
y1=zeros(size(k));
for i=1:size(k,2)
    y1(i)=k(i)+1-k(i)*(1-p)^(k(i));
end
figure(2);
plot(k,k,k,y1)
title(['Expected no. of tests vs No. of people (p=' num2str(p) ')']);
xlabel('No. of people (k)')
ylabel('Expected no. of tests')
legend('Method 1','Method 2','Location','southeast')