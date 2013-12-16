cat("Fahrenheit", "Celsius", "C\n")
for (i in seq(0,90,10)) {
	        cat(sprintf("%10.2f %7.2f %6.2f\n", i, (i-32)*5/9, (i-30)/2))
}
