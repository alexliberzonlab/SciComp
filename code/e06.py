n = int(raw_input("enter n: "))
sum = 0
for i in range(n+1):
    sum = sum + i
print "the sum of the first %d positive integers is: %d" % (n, sum)
