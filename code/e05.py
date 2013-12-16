print "Fahrenheit", "Celsius", "C"
for i in range(0,100,10):
	print "%10.2f %7.2f %6.2f" % (i, (i-32.)*5./9., (i-30)/2.0)
