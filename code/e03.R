# set up constants

Msmall <- 47.0
Mbig <- 67.0
rho <- 1.038
c <- 3.7
K <- 0.0054
Tw <- 100.0
Ty <- 70.0

whichEgg <- as.numeric(readline("Is the egg large (1) or small (0)? "))

if (whichEgg == 0) {
	M <- Msmall
} else {
	M <- Mbig
}

cat("enter the initial temperature of the egg\n")
To <- as.numeric(readline("reminder 4.0 for fridge, 20.0 for room: "))

t <- (((M**(2.0/3.0))*c*(rho**(1.0/3.0)))/(K*(pi**2)*((4.0*pi/3.0)**(2.0/3.0)))) * log(0.76 * ((To-Tw)/(Ty-Tw)))

cat("time taken to cook the egg is:",t,"seconds (",as.integer(t/60),"minutes,",as.integer(t%%60),"seconds)\n")
