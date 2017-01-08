#!/bin/bash

for x in 5 6 7 8 10 20; do
    ./encode $x > s$x.txt
done
