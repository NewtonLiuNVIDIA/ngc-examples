#!/bin/bash
#
# mnist_tensorflow.sh                             10/15/2017 
#
# Copyright (c) 2017, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.
#
# Example code to show how to run the tensorflow container with nvidia-docker
# this example does an MNIST training run

nvidia-docker run --rm \
    -w /opt/pytorch/examples/mnist \
    nvcr.io/nvidia/pytorch:17.10 \
    python main.py
