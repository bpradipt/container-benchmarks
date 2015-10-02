Set of benchmarks to execute for performance analysis for the entire docker stack

kernel (namespace syscalls, cgroups etc)
runtime (gccgo/gc)
docker 

Currently this is only tested on Ubuntu


Few benchmarks are host specific and kept under 'host' directory.
Container specific benchmarks are under 'container' directory.


Some benchmarks needs to be either triggered from an external system or
requires an associated program to be running on an external system
Those are kept in the external folder
