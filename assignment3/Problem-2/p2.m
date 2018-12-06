clear;clc;
N=[5, 10, 20, 40, 60, 80, 100, 500, 1000 , 10000];
M=150;
Alpha = 5.5;
Beta = 1;
lambda_ml = zeros(M,size(N,2));
lambda_bayesian = zeros(M,size(N,2));

for i=1:size(N,2)
	for j=1:M
		x = rand(N(i),1);
		data = -(1/5)*log(x);
		lambda_ml(j,i) = 1/mean(data); 
		lambda_bayesian(j,i) = (Alpha/N(i) + 1)/(Beta/N(i) + mean(data));
	end
end

figure(1);
boxplot(abs(lambda_ml-5)/5,'Labels',N);
title('Error for MLE v/s N');
xlabel('N');
ylabel('Relative Error');

figure(2);
boxplot(abs(lambda_bayesian-5)/5,'Labels',N);
title('Error for Posterior Mean Estimate v/s N');
xlabel('N');
ylabel('Relative Error');
