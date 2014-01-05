#!/bin/sh

# 
# Vivado(TM)
# launch.sh: a Vivado-generated ExploreAhead Script for UNIX
# Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
# 

HD_LDIR=`dirname "$0"`

# *** Create Queue Clues
HD_RUNDIR="$HD_LDIR/..\impl_1"
if [ -d "$HD_RUNDIR" ]
then
/bin/touch "$HD_RUNDIR/.Vivado Implementation.queue.rst"
fi


# *** Launch Runs (one at a time)
HD_RUNSH="$HD_LDIR/..\impl_1/runme.sh"
if [ -f "$HD_RUNSH" ]
then
"$HD_RUNSH"
fi


