# -*- coding: utf-8 -*-
# UTF-8 encoding when using korean

import sys



n = sys.stdin.readline()
arr = list(map(int, sys.stdin.readline().split()))

sum = 0
for i in arr :
	sum += i

print(sum)