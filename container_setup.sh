#!/bin/bash
#Prepare container for running the benchmarks

docker build -t benchmark/execution --rm=true .
