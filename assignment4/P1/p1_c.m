rng(0);

N = [10,1e2,1e3,1e4,1e5,1e6,1e7,1e8];

for i=N
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
    fprintf('For N=%9d, estimate = %f\n',i,4*c/i);
end
