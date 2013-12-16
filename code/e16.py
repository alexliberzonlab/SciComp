from numpy import loadtxt, mean
filename = "e16data.csv"
d = loadtxt(fname=filename,dtype=float,delimiter=",")
mean1 = mean(d[:,0])
mean2 = mean(d[:,1])