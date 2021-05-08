#!/bin/bash
lxc list | awk 'NR>3{print $2}' | grep -v '^$'