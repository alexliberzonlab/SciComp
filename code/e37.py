# first at the shell prompt, in its own terminal, start a cluster:
#   ipcluster start -n 4
#
# then start ipython:
#   ipython --pylab

# import the parallel module
#
from IPython.parallel import Client

# create a client instance
#
rc = Client()

# show the client IDs
#
rc.ids

# create a DirectView object, use all engines
#
dview = rc[:]

# we'll use parallel "map" to implement the 10
# iterations in our for loop
# the first step is to define a function that does
# the computation that we want to parallelize
#
def mycomp(x):
    return "hello from iteration #" + str(x)

# now let's use the map() function to map the mycomp() function
# across the compute engines
#
parallel_result = dview.map(mycomp, range(10))

# now show the parallel results
#
for i,r in enumerate(parallel_result):
    print r

# after the program is finished, quit ipython
# and then CTRL-C stop the ipcluster
