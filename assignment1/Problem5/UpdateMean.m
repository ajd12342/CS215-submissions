function newMean = UpdateMean (OldMean, NewDataValue, n)
newMean=(OldMean*n+NewDataValue)/(n+1);
end