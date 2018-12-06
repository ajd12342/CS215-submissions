rng(0);
N_Vals=[10,100,1000,10000,100000];
mu=[1,2]';
C=[1.6250,-1.9486;-1.9486,3.8750];
[V,D]=eig(C);
A=V*D^(0.5);
errors_mu=zeros(100,5);
errors_C=zeros(100,5);
for i=1:size(N_Vals,2)
	N=N_Vals(i);
	error_mu=zeros(100,1);
	error_C=zeros(100,1);
	for j=1:100
		X=bsxfun(@plus,A*randn(2,N),mu);
		mu_est=sum(X,2)/N;
		C_est=(bsxfun(@minus,X,mu_est))*(bsxfun(@minus,X,mu_est))'/N;
		error_C(j)=norm(C-C_est,'fro')/norm(C,'fro');
		error_mu(j)=norm(mu-mu_est)/norm(mu);
		if(j==1)
			figure(i+2);
			scatter(X(1,:),X(2,:),'b');
			[V1,D1]=eig(C_est);
			hold on;
			pt1=(mu_est+D1(1,1)*V1(:,1));
			pt2=(mu_est+D1(2,2)*V1(:,2));
			plot([mu_est(1),pt1(1)],[mu_est(2),pt1(2)],'k','LineWidth',2);
			plot([mu_est(1),pt2(1)],[mu_est(2),pt2(2)],'g','LineWidth',2);
			title(sprintf('Scatter plot with principal modes for N= %d ', N));
			xlabel('X coordinates');
			ylabel('Y coordinates');
			axis equal;
			hold off;
		end
	end
	errors_mu(:,i)=error_mu;
	errors_C(:,i)=error_C;
end
figure(1);
boxplot(errors_mu);
title('Error of MLE estimate of \mu vs log_1_0N');
xlabel('log_1_0N');
ylabel('Error between \mu and \mu_e_s_t');
figure(2);
boxplot(errors_C);
title('Error of MLE estimate of C vs log_1_0N');
xlabel('log_1_0N');
ylabel('Error between C and C_e_s_t');