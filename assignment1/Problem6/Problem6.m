clear;close all;clc;
daysInYear=365; %The code has been written so as to allow any number of days in a year. We choose 365.
P=[5,10,15,20:10:90,95,99,99.99,99.9999,100];
p=1;
Pcounter=1;
nvals=zeros(size(P));
for i=[1:daysInYear+1]
	p=p*(daysInYear+1-i)/(daysInYear);
	if(p<=1-P(Pcounter)/100)
		nvals(Pcounter)=i;
		fprintf('At least %d%%: %i \n',P(Pcounter),i);
		Pcounter=Pcounter+1;
	end
end
plot(P,nvals,'g');
title('Number of people vs. Probability of coincidence of birthday');
xlabel('Probability in %');
ylabel('Number of people');