#!/bin/bash

for x in 5 6 7 8 10 20; do
    ./decode $x < s$x.txt
done
