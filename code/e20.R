# part 1
y <- c(10,8,6,4,6,8,6,2)
barplot(y)

# part 2
y <- c(10,8,6,4,6,8,6,2)
mp <- barplot(y) # mp is the midpoints of each bar in x
axis(1, at=mp, labels=1:8) # adds the x axis plus labels
