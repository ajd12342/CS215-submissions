function newStd = UpdateStd (OldMean, OldStd, NewMean, NewDataValue, n)
NewMean=(OldMean*n+NewDataValue)/(n+1);
newStd=sqrt(((n-1)*OldStd^2 + n*((NewDataValue-OldMean)/(n+1))^2 + (NewDataValue-NewMean)^2)/n);
end
