# ipython --pylab

# part 1
x = [1,2,3,4,5]
y1 = array([1,2,3,4,4])
y2 = array([1,5,6,8,10])
y3 = array([5,4,2,2,1])
m = matrix((y1,y2,y3)).T
plot(x, m, '-o', linewidth=3, markersize=10)
xlabel("X")
ylabel("Y")

# part 2
legend(("Y1","Y2","Y3"), loc="upper left")
