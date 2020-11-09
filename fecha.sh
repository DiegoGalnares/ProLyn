#!/bin/bash

echo -e -n "\e[33mFecha actual :"
head -2 /proc/driver/rtc | cut -d ':' -f 2 | tail -1

echo -e -n "\e[32mHora actual :"
head -2 /proc/driver/rtc | cut -d ':' -f 2- | head -1

