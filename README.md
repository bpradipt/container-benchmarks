#Description
Set of benchmarks to execute for performance analysis for the entire docker stack

kernel (namespace syscalls, cgroups etc)  
runtime (gccgo/gc)  
docker  

Currently this is only tested on Ubuntu.

Few benchmarks are host specific and kept under 'host' directory.
Container specific benchmarks are under 'container' directory.

Some benchmarks needs to be either triggered from an external system or
requires an associated program to be running on an external system
Those are kept in the external folder.

#Acknowledgements  
The idea and inspiration for this came from Jeremy Eder's excellent work in  
evaluating docker performance. More details [here](http://redhat.slides.com/jeremyeder/performance-analysis-of-docker#/)


#Instructions for Running the Benchmarks

1. Setup the system  
    ./host_setup.sh  
    ./container_setup.sh  

2. Run the container benchmarks  
    ./container_run.sh  
    This will run all the container benchmarks  

    ./container_run.sh wordpress
    This will run only the wordpress test

    ./external/apachebench.sh <container-IP:port>  
    This will run apachebench against the container  

3. Run the host benchmarks  
    ./host_benchmark_setup.sh  
    ./host_benchmark_run.sh  
