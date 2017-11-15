#!/usr/bin/env bash

sudo ip tuntap add dev tap0 mode tap
sudo ip link set tap0 up promisc on
sudo brctl addif virbr0 tap0
