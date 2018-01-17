#!/bin/bash
#set all video card fan speeds

FANSPEED=$1

#nvidia-smi -L returns a line for each GPU detected
NUMGPUS=$(nvidia-smi -L | wc -l)
echo "Setting all $NUMGPUS GPUs to $FANSPEED % fan speed..."
GPU=0
while [ $GPU -lt $NUMGPUS ]
        DISPLAY=:0 XAUTHORITY=/var/run/lightdim/root/:0 nvidia-settings -a [gpu:$GPU]/GPUFanControlState=1
        DISPLAY=:0 XAUTHORITY=/var/run/lightdim/root/:0 nvidia-settings -a [fan:$GPU]/GPUTargetFanSpeed=$FANSPEED
        ((GPU++))
done
