function newMedian = UpdateMedian (oldMedian, NewDataValue, A, n)
newMedian=0;
if(n==1)
	newMedian=(A(1)+NewDataValue)/2;
elseif(rem(n,2)==1)
    if(NewDataValue>=A((n+1)/2))
        if(NewDataValue<=A((n+1)/2+1))
            newMedian=(A((n+1)/2)+NewDataValue)/2;
		else
			newMedian=(A((n+1)/2)+A((n+1)/2+1))/2;
		end
	else
		if(NewDataValue>=A((n+1)/2-1))
            newMedian=(A((n+1)/2)+NewDataValue)/2;
		else
			newMedian=(A((n+1)/2)+A((n+1)/2-1))/2;
		end
	end
else
	if(NewDataValue>=A(n/2)&&NewDataValue<=A(n/2+1))
		newMedian=NewDataValue;
	else
		if(NewDataValue<A(n/2))
			newMedian=A(n/2);
		else
			newMedian=A(n/2+1);
		end
	end
end
end