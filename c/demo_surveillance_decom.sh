#! /bin/bash


in="data/hall"

rho=0.5
niter=1024
mflags=3
flags=7
skip=4

export DEBUG_LEVEL=5

bartview.py $in&

# Do multi-scale low rank decomposition
bart lrmatrix -d -j $skip -H -m $mflags -f $flags -p $rho -i $niter -o $in"_rec" $in $in"_decom"&

# Plot
bartview.py $in"_decom"&
