# ipython --pylab

# part 1
y = [10,8,6,4,6,8,6,2]
bar(range(8), height=y)
xlabel(()) # empty to get rid of x labels

# part 2
clf()
bar(range(8), height=y)
xticks(arange(8)+0.5, range(8)) # location, label
