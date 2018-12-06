clear;close all;clc;
x=[-3:0.02:3];
y=5*cos(2.2*x+pi/3);
z=y;
f=0.3;
randindices=randperm(size(z,2),uint16(f*size(z,2)));
z(randindices)=z(randindices)+100+20*rand(size(randindices));
y1=zeros(size(z));
y2=zeros(size(z));
y3=zeros(size(z));
for i=1:size(z,2)
    y1(i)=median(z(max(i-8,1):min(i+8,size(z,2))));
    y2(i)=mean(z(max(i-8,1):min(i+8,size(z,2))));
    y3(i)=prctile(z(max(i-8,1):min(i+8,size(z,2))),25);
end
figure('Name','For f=30%');
plot(x,y,'k');
hold on;
plot(x,z,'g');
plot(x,y1);
plot(x,y2);
plot(x,y3);
legend('Original','Corrupted','Using median','Using mean','Using 25th percentile');
hold off;
err1=((y-y1)*(y-y1)')/(y*y');
err2=((y-y2)*(y-y2)')/(y*y');
err3=((y-y3)*(y-y3)')/(y*y');
fprintf('Relative mean squared error for f=30%%:\n');
fprintf('Moving median filtering:%d\n',err1);
fprintf('Moving average filtering:%d\n',err2);
fprintf('Moving quartile filtering:%d\n',err3);
z=y;
f=0.6;
randindices=randperm(size(z,2),uint16(f*size(z,2)));
z(randindices)=z(randindices)+100+20*rand(size(randindices));
y1=zeros(size(z));
y2=zeros(size(z));
y3=zeros(size(z));
for i=1:size(z,2)
    y1(i)=median(z(max(i-8,1):min(i+8,size(z,2))));
    y2(i)=mean(z(max(i-8,1):min(i+8,size(z,2))));
    y3(i)=prctile(z(max(i-8,1):min(i+8,size(z,2))),25);
end
figure('Name','For f=60%');
plot(x,y,'k');
hold on;
plot(x,z,'g');
plot(x,y1);
plot(x,y2);
plot(x,y3);
legend('Original','Corrupted','Using median','Using mean','Using 25th percentile');
err1=((y-y1)*(y-y1)')/(y*y');
err2=((y-y2)*(y-y2)')/(y*y');
err3=((y-y3)*(y-y3)')/(y*y');
fprintf('\nRelative mean squared error for f=60%%:\n');
fprintf('Moving median filtering:%d\n',err1);
fprintf('Moving average filtering:%d\n',err2);
fprintf('Moving quartile filtering:%d\n',err3);

