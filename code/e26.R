library(lattice)
g <- expand.grid(x=seq(-8,8,0.1),y=seq(-8,8,0.1))
r <- sqrt((g$x*g$x) + (g$y*g$y)) + 0.00001
g$z <- sin(r)/r
wireframe(z ~ x * y, data=g, shade=TRUE, light.source = c(10,0,10))
