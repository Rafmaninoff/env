#!/usr/bin/python

import os
from os import listdir
from os.path import isfile, join
from random import randint

dir = "/home/raf/Wallpapers/"

files = [f for f in listdir(dir) if isfile(join(dir, f))]

#Select a random item number from the array
n = randint(0, (len(files))-1)

#set it as the wallpaper
os.system("feh --bg-scale " + dir + files[n])
