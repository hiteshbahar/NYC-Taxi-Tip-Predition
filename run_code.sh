#!/usr/bin/env python
import subprocess
with open("output.txt", "w+") as output:
    subprocess.call(["python", "./Classifiers.py"],
stdout=output);