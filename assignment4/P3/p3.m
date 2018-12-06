% Load MNIST dataset
% Ref : https://github.com/davidstutz/matlab-mnist-two-layer-perceptron/blob/master/loadMNISTImages.m
% Assumptions: 
% 1. The training data-set is used
% 2. The extracted train-images and train-labels are present in the same folder as the code


fp = fopen('train-images-idx3-ubyte', 'rb');
magic = fread(fp, 1, 'int32', 0, 'ieee-be');
numImages = fread(fp, 1, 'int32', 0, 'ieee-be');
numRows = fread(fp, 1, 'int32', 0, 'ieee-be');
numCols = fread(fp, 1, 'int32', 0, 'ieee-be');
images = fread(fp, inf, 'unsigned char');
images = reshape(images, numCols, numRows, numImages);
images = permute(images,[2 1 3]);
fclose(fp);

fp=fopen('train-labels-idx1-ubyte', 'rb');
magic2 = fread(fp, 1, 'int32', 0, 'ieee-be');
numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');
labels = fread(fp, inf, 'unsigned char');
fclose(fp);

images = reshape(images, numRows*numCols, numImages);
images = double(images.')/255;

es = [];
pltno=1;
for i = 0:9
    img = images(labels==i,:);
    mu = mean(img);
    covariance = cov(img);
    [v,lambda] = eig(covariance);
    lambda = diag(lambda);
    [lambda1, idx] = max(lambda);
    v1 = v(:,idx);
    es = [es sort(lambda,'descend')];
    
    subplot(5,6,pltno);
    imshow(reshape(mu.'-sqrt(lambda1)*v1,28,28));
    title('(i)');
    pltno = pltno+1;
    
    subplot(5,6,pltno);
    imshow(reshape(mu,28,28));
    title('(ii)');
    pltno = pltno+1;
    
    subplot(5,6,pltno);
    imshow(reshape(mu.'+sqrt(lambda1)*v1,28,28));
    title('(iii)');
    pltno = pltno+1;
end

figure(11);
plot(1:28*28, es);
title('Sorted Eigenvalues')
legend('0','1','2','3','4','5','6','7','8','9');

for i = 0:9
    t = 1;
    while( sum(es(1:t,i+1))/sum(es(:,i+1)) < .9)
        t = t + 1;
    end
    fprintf('For %d, no. of significant modes of variation = %d\n',i,t);
	fprintf('Smallest significant eigenvalue=%f \n \n',es(t,i+1)); 
end
    
        