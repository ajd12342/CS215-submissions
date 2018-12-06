clear;clc;
N=[5, 10, 20, 40, 60, 80, 100, 500, 1000 , 10000];
M=150;
mu_ml = zeros(size(N,2),M);
mu_map1 = zeros(size(N,2),M);
mu_map2 = zeros(size(N,2),M);

for i=1:size(N,2)
	for j=1:M
		data = 4*randn(N(i),1)+10;
		mu_ml(i,j) = mean(data);
		mu_map1(i,j) = (mean(data)+16*10.5/N(i))/(1+16/N(i));
		mu_map2(i,j) = min(max(mean(data),9.5),11.5);
	end
end

figure(1);
boxplot(abs(mu_ml.'-10)/10,'Labels',N);
title('Error for MLE v/s N');
xlabel('N');
ylabel('Relative Error');

figure(2);
boxplot(abs(mu_map1.'-10)/10,'Labels',N);
title('Error for MAP1 v/s N');
xlabel('N');
ylabel('Relative Error');

figure(3);
boxplot(abs(mu_map2.'-10)/10,'Labels',N);
title('Error for MAP2 v/s N');
xlabel('N');
ylabel('Relative Error');
