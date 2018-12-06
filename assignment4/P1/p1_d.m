M_lb = 1;
M_ub = 1e8;
M = 0;
p = 0;
M_ans=1e9;
while(M_lb<M_ub)
    M = double(int64(M_lb+M_ub)/2);
    s_lb = ceil(M*(pi-0.01)/4);
    s_ub = floor(M*(pi+0.01)/4);
    p = 0;
    for i=s_lb:s_ub
        p = p + exp(gammaln(M+1)-gammaln(i+1)-gammaln(M-i+1) + i*log(pi/4) + (M-i)*log(1-pi/4));
	end
    if(p>=0.95)
		if(M<M_ans)
			M_ans=M;
		end
        M_ub = int64(M-1);
	elseif(p<0.95)
        M_lb = int64(M+1);
    else
        break;
	end
end
M=M_ans;
s_lb = ceil(M*(pi-0.01)/4);
s_ub = floor(M*(pi+0.01)/4);
p = 0;
for i=s_lb:s_ub
    p = p + exp(gammaln(M+1)-gammaln(i+1)-gammaln(M-i+1) + i*log(pi/4) + (M-i)*log(1-pi/4));
end
fprintf('For M=%d, p=%f\n',M,p)
i=M;
rng(0);
c = 0;
batches=int64(i/1e8);
if(batches>0)
	for j=1:batches
		data = 2*(rand(1e8,2,'single')-0.5);
		c = c + sum((data(:,1).^2+data(:,2).^2<=1));
	end
	if(i-batches*1e8 > 0)
		data = 2*(rand(i-batches*1e8,2,'single')-0.5);
		c = c + sum((data(:,1).^2+data(:,2).^2<=1));
	end
else
	data = 2*(rand(i,2,'single')-0.5);
		c = c + sum((data(:,1).^2+data(:,2).^2<=1));
end
fprintf('For M=%d, estimate = %f\n',i,4*c/i);