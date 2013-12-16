from pandas.io.excel import read_excel
from numpy import mean

d = read_excel("e17data.xlsx","Sheet 1 - Table 1")
m1 = mean(d['age'])
m2 = mean(d['score'])