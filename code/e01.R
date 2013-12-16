tempc <- readline("enter the temperature in Celsius: ")
tempc <- as.numeric(tempc)
tempf <- ((9 / 5) * tempc) + 32
cat(tempc, "degrees Celsius is", tempf, "degrees Fahrenheit\n")
